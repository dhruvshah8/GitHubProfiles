//
//  UserDetailsMainInfoView.swift
//  GitHub+
//
//  Created by Dhruv Shah on 2020-07-25.
//  Copyright © 2020 Dhruv Shah. All rights reserved.
//

import UIKit

protocol UserDetailsMainInfoViewDelegate: class {
	func didChangeFavoriteStatus(for user: GithubUser, to value: Bool)
}

class UserDetailsMainInfoView: UIView {
	// MARK: - Properties
	
	private let user: GithubUser

	let profileImageView = GFImageView()
	private let favoriteButton = GFFavoriteButton(sideSize: 30, animationDuration: 0.4)
	private let favoriteButtonOffset = CGPoint(x: -3, y: -5)

	weak var delegate: UserDetailsMainInfoViewDelegate?

	
	// MARK: - Init
	
	init(user: GithubUser, isFavorite: Bool) {
		self.user = user
		super.init(frame: .zero)
		
		setupSubviews()
		setupFavoriteButton(initialState: isFavorite)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	
	// MARK: - Setup
	
	private func setupSubviews() {
		// profile image
		profileImageView.layer.setCornerRadius(12)
		profileImageView.layer.setBorder(color: .gfImageBorder)
		profileImageView.constrainSize(width: 100, height: 100)
		
		// labels
		let usernameLabel = GFLabel(text: user.username, fontSize: 28, fontWeight: .medium)
		let fullNameLabel = GFLabel(text: user.fullName, image: .sfSymbolPerson)
		let locationLabel = GFLabel(text: user.location, image: .sfSymbolMappinAndEllipse)
		let companyNameLabel = GFLabel(text: user.companyName, image: .sfSymbolCCircle)

		// stacks
		let userInfoStack = VStackView([usernameLabel, fullNameLabel, locationLabel, companyNameLabel], spacing: 5)
		
		let mainStack = HStackView([profileImageView, userInfoStack], spacing: 24, alignment: .top)
		addSubview(mainStack)
		
		// addition padding needs to be set to "fit" button touch area inside parent view
		let bottomPadding = favoriteButton.bounds.height / 2 + favoriteButtonOffset.y

		mainStack.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			mainStack.leadingAnchor.constraint(equalTo: leadingAnchor),
			mainStack.trailingAnchor.constraint(equalTo: trailingAnchor),
			mainStack.topAnchor.constraint(equalTo: topAnchor),
			mainStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -bottomPadding)
		])
	}
	
	private func setupFavoriteButton(initialState: Bool) {
		favoriteButton.isSelected = initialState

		favoriteButton.addTarget(self, action: #selector(favoriteButtonDidPressed), for: .touchUpInside)

		addSubview(favoriteButton)
		favoriteButton.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			favoriteButton.centerXAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: favoriteButtonOffset.x),
			favoriteButton.centerYAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: favoriteButtonOffset.y),
			favoriteButton.widthAnchor.constraint(equalToConstant: favoriteButton.bounds.width),
			favoriteButton.heightAnchor.constraint(equalToConstant: favoriteButton.bounds.height)
		])
	}
	
	
	// MARK: - Private methods
	
	@objc private func favoriteButtonDidPressed() {
		favoriteButton.isSelected.toggle()
		delegate?.didChangeFavoriteStatus(for: user, to: favoriteButton.isSelected)
	}
}
