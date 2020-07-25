//
//  Parser.swift
//  GitHub+
//
//  Created by Dhruv Shah on 2020-07-25.
//  Copyright © 2020 Dhruv Shah. All rights reserved.
//

import Foundation

class Parser {
	// MARK: - API

	static func parse<T: Decodable>(_ data: Data?) throws -> T {
		guard let data = data else {
			throw ParseError.noDataToParse
		}
		
		do {
			let jsonDecoder = JSONDecoder()
			jsonDecoder.dateDecodingStrategy = .iso8601

			return try jsonDecoder.decode(T.self, from: data)
		} catch {
			throw ParseError.couldNotParse(error)
		}
	}
	
	
	// MARK: - Errors
	
	enum ParseError: LocalizedError {
		case noDataToParse
		case couldNotParse(Error)
		
		var errorDescription: String? {
			switch self {
			case .noDataToParse:
				return "No data to parse."
			case .couldNotParse:
				return "Could not parse data."
			}
		}
	}
}
