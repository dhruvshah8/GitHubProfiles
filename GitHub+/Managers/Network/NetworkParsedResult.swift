//
//  NetworkParsedResult.swift
//  GitHub+
//
//  Created by Dhruv Shah on 2020-07-25.
//  Copyright © 2020 Dhruv Shah. All rights reserved.
//

import Foundation

struct NetworkParsedResult<T: Decodable> {
	let data: T
	let headers: NetworkResponse.Headers
}
