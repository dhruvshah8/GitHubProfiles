//
//  UITableViewCell + Extensions.swift
//  GitHub+
//
//  Created by Dhruv Shah on 2020-07-25.
//  Copyright © 2020 Dhruv Shah. All rights reserved.
//

import UIKit

extension UITableViewCell {
	
	static var reuseId: String {
		String(describing: self)
	}
}
