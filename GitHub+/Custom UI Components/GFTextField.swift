//
//  GFTextField.swift
//  GitHub+
//
//  Created by Dhruv Shah on 2020-07-25.
//  Copyright © 2020 Dhruv Shah. All rights reserved.
//

import UIKit

class GFTextField: UITextField {
	// MARK: - Init
	
	init(placeholder: String? = nil, useAutoCorrection: Bool = false, showClearButton: Bool = true) {
		super.init(frame: .zero)
		
		self.placeholder = placeholder
		autocorrectionType = useAutoCorrection ? .yes : .no
		clearButtonMode = showClearButton ? .always : .never
		setupView()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
	// MARK: - API
	
	func showWrongInputAnimation() {
		// "shake" textfield
		transform = transform.translatedBy(x: 8, y: 0)
		
		UIView.animate(withDuration: 0.8, delay: 0, usingSpringWithDamping: 0.1, initialSpringVelocity: 0.1, animations: {

			self.transform = .identity
		})
		
		// temporary change border color
		let borderColorAnimation = CABasicAnimation(keyPath: #keyPath(CALayer.borderColor))
		borderColorAnimation.duration = 0.3
		borderColorAnimation.autoreverses = true
		borderColorAnimation.fromValue = layer.borderColor
		borderColorAnimation.toValue = UIColor.gfError.cgColor
		
		layer.add(borderColorAnimation, forKey: nil)
	}
	
	
	// MARK: - Setup
	
	private func setupView() {
		backgroundColor = .gfTextFieldBackground
		layer.setBorder(color: .gfTextFieldBorder, width: 2)
		layer.setCornerRadius(8)
	}
	
	// override textRect and editingRect to set inner bounds insets for placeholder and text
	override func textRect(forBounds bounds: CGRect) -> CGRect {
		super.textRect(forBounds: bounds).insetBy(dx: 8, dy: 0)
	}
	
	override func editingRect(forBounds bounds: CGRect) -> CGRect {
		super.editingRect(forBounds: bounds).insetBy(dx: 8, dy: 0)
	}
}
