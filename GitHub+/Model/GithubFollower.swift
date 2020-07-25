//
//  GithubFollower.swift
//  GitHub+
//
//  Created by Dhruv Shah on 2020-07-25.
//  Copyright © 2020 Dhruv Shah. All rights reserved.
//

import Foundation

struct GithubFollower: GithubProfile, Hashable {
	let username: String
	let profileImageUrl: URL?
}


// MARK: - Decodable

extension GithubFollower: Decodable {
	
	enum CodingKeys: String, CodingKey {
		case username = "login"
		case profileImageUrl = "avatar_url"
	}
}
