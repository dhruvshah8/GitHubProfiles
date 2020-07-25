//
//  VStackView.swift
//  GitHub+
//
//  Created by Dhruv Shah on 2020-07-25.
//  Copyright © 2020 Dhruv Shah. All rights reserved.
//

import UIKit

class VStackView: CustomStackView {
	// MARK: - Init
	
	override init(_ arrangedSubviews: [UIView],
				  spacing: CGFloat = 0,
				  alignment: UIStackView.Alignment = .fill,
				  distribution: UIStackView.Distribution = .fill) {

		super.init(arrangedSubviews, spacing: spacing, alignment: alignment, distribution: distribution)
		axis = .vertical
	}
	
	required init(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
