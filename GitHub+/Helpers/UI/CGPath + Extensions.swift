//
//  CGPath + Extensions.swift
//  GitHub+
//
//  Created by Dhruv Shah on 2020-07-25.
//  Copyright © 2020 Dhruv Shah. All rights reserved.
//

import CoreGraphics

extension CGPath {

	static func circle(in rect: CGRect) -> CGPath {
		CGPath(ellipseIn: rect, transform: nil)
	}
	
	static func circle(center: CGPoint, radius: CGFloat) -> CGPath {
		circle(in: CGRect(origin: center, size: CGSize(width: radius * 2, height: radius * 2)))
	}
}
