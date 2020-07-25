//
//  GFErrorMessageView.swift
//  GitHub+
//
//  Created by Dhruv Shah on 2020-07-25.
//  Copyright © 2020 Dhruv Shah. All rights reserved.
//

import UIKit

class GFErrorMessageView: UIView {
	// MARK: - Init
	
	private let message: String
	
	init(message: String) {
		self.message = message
		super.init(frame: .zero)

		setupView()
		setupSubviews()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
	// MARK: - Setup
	
	private func setupView() {
		isOpaque = false
		
		layer.setCornerRadius(12)
	}
	
	private func setupSubviews() {
		// blur background
		let blurEffect = UIBlurEffect(style: .systemMaterialDark)
		let blurEffectView = UIVisualEffectView(effect: blurEffect)
		addSubview(blurEffectView)
		blurEffectView.constrainToSuperview()
		
		// message label
		let messageLabel = GFLabel(text: message, fontSize: 17, color: .gfTextAccented, alignment: .center, allowMultipleLines: true)
		
		addSubview(messageLabel)
		messageLabel.constrainToSuperview(padding: 18)
	}
}
