//
//  ApplicationAppearanceManager.swift
//  GitHub+
//
//  Created by Dhruv Shah on 2020-07-25.
//  Copyright © 2020 Dhruv Shah. All rights reserved.
//

import UIKit

struct ApplicationAppearanceManager {

	static func setupAppearance() {
		// tab bar
		UITabBar.appearance().tintColor = .gfPrimary
		
		// navigation bar
		UINavigationBar.appearance().tintColor = .gfPrimary
		
		// button
		UIButton.appearance().tintColor = .gfPrimary
	}
}
