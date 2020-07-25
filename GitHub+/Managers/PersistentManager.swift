//
//  PersistentManager.swift
//  GitHub+
//
//  Created by Dhruv Shah on 2020-07-25.
//  Copyright © 2020 Dhruv Shah. All rights reserved.
//

import Foundation

class PersistentManager {
	// MARK: - Properties

	private let userDefaults = UserDefaults.standard

	
	// MARK: - API
	
	func get<T: Decodable>(type: T.Type, from key: ResourceKey) -> T? {

		guard let data = userDefaults.data(forKey: key.name) else {
			return nil
		}
		
		return try? PropertyListDecoder().decode(T.self, from: data)
	}
	
	func set<T: Encodable>(value: T, to key: ResourceKey) {
		let data = try? PropertyListEncoder().encode(value)
		userDefaults.set(data, forKey: key.name)
	}

	
	// MARK: - Keys
	
	enum ResourceKey: String {
		case favorites
		
		var name: String {
			rawValue
		}
	}
}
