//
//  CGSize + Extensions.swift
//  GitHub+
//
//  Created by Dhruv Shah on 2020-07-25.
//  Copyright © 2020 Dhruv Shah. All rights reserved.
//

import CoreGraphics

extension CGSize {

	static func square(_ sideSize: CGFloat) -> CGSize {
		CGSize(width: sideSize, height: sideSize)
	}
}
