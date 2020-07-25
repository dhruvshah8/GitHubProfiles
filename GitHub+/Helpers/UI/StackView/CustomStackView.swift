//
//  CustomStackView.swift
//  GitHub+
//
//  Created by Dhruv Shah on 2020-07-25.
//  Copyright © 2020 Dhruv Shah. All rights reserved.
//

import UIKit

class CustomStackView: UIStackView {
	// MARK: - Init
	
	init(_ arrangedSubviews: [UIView],
		 spacing: CGFloat = 0,
		 alignment: UIStackView.Alignment = .fill,
		 distribution: UIStackView.Distribution = .fill) {

		super.init(frame: .zero)
		
		// setup
		arrangedSubviews.forEach(addArrangedSubview)
		self.spacing = spacing
		self.alignment = alignment
		self.distribution = distribution
	}
	
	required init(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
