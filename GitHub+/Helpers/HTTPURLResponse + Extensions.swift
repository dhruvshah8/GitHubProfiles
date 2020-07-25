//
//  HTTPURLResponse + Extensions.swift
//  GitHub+
//
//  Created by Dhruv Shah on 2020-07-25.
//  Copyright © 2020 Dhruv Shah. All rights reserved.
//

import Foundation

extension HTTPURLResponse {

	func getHeader(_ headerName: String) -> String? {
		allHeaderFields[headerName] as? String
	}
}
