//
//  CAShapeLayer + Extensions.swift
//  GitHub+
//
//  Created by Dhruv Shah on 2020-07-25.
//  Copyright © 2020 Dhruv Shah. All rights reserved.
//

import UIKit

extension CAShapeLayer {
	convenience init(path: CGPath) {
		self.init()
		
		self.path = path
	}
}
