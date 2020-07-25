//
//  GFButton.swift
//  GitHub+
//
//  Created by Dhruv Shah on 2020-07-25.
//  Copyright © 2020 Dhruv Shah. All rights reserved.
//

import UIKit

class GFButton: UIButton {
	// MARK: - Init
	
	convenience init(title: String = "",
					 color: UIColor? = .gfTextAccented,
					 backgroundColor: UIColor = .gfPrimary) {

		self.init(type: .system)
		
		// setup
		setTitle(title, for: .normal)
		self.tintColor = color
		self.backgroundColor = backgroundColor

		setupView()
	}
	
	
	// MARK: - Setup
	
	private func setupView() {
		titleLabel?.font = .systemFont(ofSize: 19, weight: .medium)
		layer.setCornerRadius(8)
	}
}
