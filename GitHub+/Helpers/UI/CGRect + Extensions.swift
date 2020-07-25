//
//  CGRect + Extensions.swift
//  GitHub+
//
//  Created by Dhruv Shah on 2020-07-25.
//  Copyright © 2020 Dhruv Shah. All rights reserved.
//

import CoreGraphics

extension CGRect {

	var center: CGPoint {
		CGPoint(x: midX, y: midY)
	}
	
	// excircle bounds square of given rect
	var excircleSquare: CGRect {
		let outerDiameter = (width * width + height * height).squareRoot() // hypotenuse

		let offsetX = (outerDiameter - width) / 2
		let offsetY = (outerDiameter - height) / 2
		return CGRect(origin: CGPoint(x: -offsetX, y: -offsetY), size: .square(outerDiameter))
	}
}
