//
//  GFImageView.swift
//  GitHub+
//
//  Created by Dhruv Shah on 2020-07-25.
//  Copyright © 2020 Dhruv Shah. All rights reserved.
//

import UIKit

class GFImageView: UIImageView {
	// MARK: - Properties
	
	private let loadingIndicatorView = UIActivityIndicatorView(style: .medium)
	override var image: UIImage? { didSet { updateUI() } }

	
	// MARK: - Init
	
	override init(image: UIImage? = nil) {
		super.init(image: image)
		
		setupView()
		setupLoadingIndicator()
		updateUI()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
	// MARK: - Setup
	
	private func setupView() {
		contentMode = .scaleAspectFit
	}
	
	private func setupLoadingIndicator() {
		loadingIndicatorView.color = .gfPrimary
	}
	
	
	// MARK: - Private methods
	
	private func updateUI() {
		// show loading indicator if there is no image was set
		
		if image == nil {
			guard !loadingIndicatorView.isAnimating else { return }

			loadingIndicatorView.startAnimating()
			addSubview(loadingIndicatorView)
			loadingIndicatorView.constrainCenter(to: self)
			
		} else {
			loadingIndicatorView.stopAnimating()
			loadingIndicatorView.removeFromSuperview()
		}
	}
}
