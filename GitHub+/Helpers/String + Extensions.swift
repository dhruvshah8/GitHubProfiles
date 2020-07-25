//
//  String + Extensions.swift
//  GitHub+
//
//  Created by Dhruv Shah on 2020-07-25.
//  Copyright © 2020 Dhruv Shah. All rights reserved.
//

import Foundation

extension String {

	var trimmed: String {
		trimmingCharacters(in: .whitespacesAndNewlines)
	}
	
	func firstRegExpMatch(of pattern: String) -> String? {
		guard let matchedRange = range(of: pattern, options: .regularExpression) else {
			return nil
		}

		let match = self[matchedRange]
		return String(match)
	}
	
	func contains(_ term: String) -> Bool {
		localizedCaseInsensitiveContains(term)
	}
}
