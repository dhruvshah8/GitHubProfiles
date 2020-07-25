//
//  MainTabBarController.swift
//  GitHub+
//
//  Created by Dhruv Shah on 2020-07-25.
//  Copyright © 2020 Dhruv Shah. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
	// MARK: - Init
	
	init() {
		super.init(nibName: nil, bundle: nil)

		setupTabBar()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
	// MARK: - Setup
	
	private func setupTabBar() {
		let searchNC = UINavigationController(rootViewController: SearchViewController())
		let favoritesNC = UINavigationController(rootViewController: FavoritesViewController())

		viewControllers = [searchNC, favoritesNC]
	}
}
