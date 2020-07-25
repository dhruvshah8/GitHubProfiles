//
//  KeyboardNotificationUserInfo.swift
//  GitHub+
//
//  Created by Dhruv Shah on 2020-07-25.
//  Copyright © 2020 Dhruv Shah. All rights reserved.
//

import UIKit

struct KeyboardNotificationUserInfo {
	let animationDuration: TimeInterval
	let frame: CGRect
	let height: CGFloat
	let width: CGFloat
	
	init?(userInfo: [AnyHashable : Any]?) {
		guard
			let userInfo = userInfo,
			let animationDuration = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? TimeInterval,
			let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect
			else {
				return nil
		}
		
		self.animationDuration = animationDuration
		self.frame = keyboardFrame
		self.height = keyboardFrame.size.height
		self.width = keyboardFrame.size.width
	}
}
