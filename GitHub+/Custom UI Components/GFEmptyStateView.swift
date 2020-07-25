//
//  GFEmptyStateView.swift
//  GitHub+
//
//  Created by Dhruv Shah on 2020-07-25.
//  Copyright © 2020 Dhruv Shah. All rights reserved.
//

import UIKit

class GFEmptyStateView: UIView {
	// MARK: - Properties
	
	private let text: String
	private let image: UIImage?
	
	
	// MARK: - Init
	
	init(text: String, image: UIImage? = .assetEmptyState) {
		self.text = text
		self.image = image
		
		super.init(frame: .zero)
		setupSubviews()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
	// MARK: - Setup
	
	private func setupSubviews() {
		// label
		let emptyStateLabel = GFLabel(text: text, fontSize: 22.5, color: .gfTextSecondary, alignment: .center, allowMultipleLines: true)
		
		addSubview(emptyStateLabel)
		emptyStateLabel.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			emptyStateLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
			emptyStateLabel.bottomAnchor.constraint(equalTo: centerYAnchor, constant: -80),
			emptyStateLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8)
		])
		
		// image
		let emptyStateImageView = GFImageView(image: image)
		
		addSubview(emptyStateImageView)
		emptyStateImageView.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			emptyStateImageView.topAnchor.constraint(equalTo: emptyStateLabel.bottomAnchor),
			emptyStateImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
			emptyStateImageView.centerXAnchor.constraint(equalTo: trailingAnchor, constant: -50)
		])
	}
}
