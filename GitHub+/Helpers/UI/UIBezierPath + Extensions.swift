//
//  UIBezierPath + Extensions.swift
//  GitHub+
//
//  Created by Dhruv Shah on 2020-07-25.
//  Copyright © 2020 Dhruv Shah. All rights reserved.
//

import UIKit

extension UIBezierPath {

	func scaled(to rect: CGRect) -> UIBezierPath {
		let scaledPath = copy() as! UIBezierPath
		
		// scale to fit
		let scaleFactor = min(rect.width / bounds.width, rect.height / bounds.height)
		scaledPath.apply(CGAffineTransform(scaleX: scaleFactor, y: scaleFactor))
		
		return scaledPath
	}
}
