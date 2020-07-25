//
//  GithubProfile.swift
//  GitHub+
//
//  Created by Dhruv Shah on 2020-07-25.
//  Copyright © 2020 Dhruv Shah. All rights reserved.
//

import Foundation

protocol GithubProfile {
	var username: String { get }
	var profileImageUrl: URL? { get }
}
