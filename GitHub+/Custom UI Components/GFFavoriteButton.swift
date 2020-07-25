//
//  GFFavoriteButton.swift
//  GitHub+
//
//  Created by Dhruv Shah on 2020-07-25.
//  Copyright © 2020 Dhruv Shah. All rights reserved.
//

import UIKit

class GFFavoriteButton: GFCustomPathButton {
	// MARK: - Init

	init(sideSize: CGFloat, animationDuration: TimeInterval) {
		super.init(path: .starSymbol,
				   sideSize: sideSize,
				   borderWidth: 2,
				   animationDuration: animationDuration,
				   borderColor: .gfFavoriteButtonBorder,
				   fillColor: .gfFavoriteButtonFill,
				   backgroundFillColor: .gfFavoriteButtonBackground)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
