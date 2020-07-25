//
//  GFColors.swift
//  GitHub+
//
//  Created by Dhruv Shah on 2020-07-25.
//  Copyright © 2020 Dhruv Shah. All rights reserved.
//

import UIKit

extension UIColor {
	// Main
	static let gfPrimary = UIColor.systemGreen
	static let gfSecondary = UIColor.systemPurple
	static let gfBackground = UIColor.systemBackground

	// Text
	static let gfText = UIColor.label
	static let gfTextAccented = UIColor.white
	static let gfTextSecondary = UIColor.secondaryLabel

	// Text field
	static let gfTextFieldBorder = UIColor.tertiarySystemFill
	static let gfTextFieldBackground = UIColor.tertiarySystemBackground

	// Image
	static let gfImageBorder = UIColor.systemGray3
	
	// Favorite cell
	static let gfFavoriteCell = UIColor.tertiarySystemBackground
	static let gfFavoriteCellSelected = UIColor.secondarySystemBackground

	// Favorite button
	static let gfFavoriteButtonBorder = UIColor.systemOrange.withAlphaComponent(0.8)
	static let gfFavoriteButtonFill = UIColor.systemOrange.withAlphaComponent(0.55)
	static let gfFavoriteButtonBackground = UIColor.white
	
	// Info block
	static let gfDetailsInfoBlockBackground = UIColor.secondarySystemBackground
	
	// Other
	static let gfShadow = UIColor.black
	static let gfError = UIColor.systemRed
}
