//
//  URL + Extensions.swift
//  GitHub+
//
//  Created by Dhruv Shah on 2020-07-25.
//  Copyright © 2020 Dhruv Shah. All rights reserved.
//

import Foundation

extension URL {

	func appendingPath(_ pathComponents: String...) -> URL {
		pathComponents.reduce(into: self) { url, pathComponent in
			url.appendPathComponent(pathComponent.lowercased())
		}
	}
	
	func appendingQuery(_ queryName: String, value queryValue: String) -> URL? {

		var urlComponents = URLComponents(url: self, resolvingAgainstBaseURL: false)
		var queryItems = urlComponents?.queryItems ?? []
		queryItems.append(URLQueryItem(name: queryName, value: queryValue))
		urlComponents?.queryItems = queryItems
		
		return urlComponents?.url
	}
	
	func appendingQuery(_ queryName: String, value queryValue: Int) -> URL? {
		appendingQuery(queryName, value: "\(queryValue)")
	}
}
