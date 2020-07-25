//
//  FavoriteCell.swift
//  GitHub+
//
//  Created by Dhruv Shah on 2020-07-25.
//  Copyright © 2020 Dhruv Shah. All rights reserved.
//

import UIKit
import Combine

class FavoriteCell: UITableViewCell {
	// MARK: - Properties
	
	private let containerView = UIView()
	private let photoImageView = GFImageView()
	private let usernameLabel = GFLabel(fontSize: 22)
	private let followersCountLabel = GFLabel(fontSize: 16, color: .gfTextSecondary)
	
	private var imageDownloaderSubscriber: AnyCancellable?

	
	// MARK: - Init
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		
		setupView()
		setupContainerView()
		setupSubviews()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
	// MARK: - Setup
	
	private func setupView() {
		selectionStyle = .none
	}
	
	private func setupContainerView() {
		containerView.layer.setShadow(radius: 3, opacity: 0.1, offsetX: 2, offsetY: 2)

		contentView.addSubview(containerView)
		containerView.translatesAutoresizingMaskIntoConstraints = false
		let padding: CGFloat = 9
		
		// set priority for vertical anchors to fix autolayout issues on contentView size changes
		let containerViewTopAnchor = containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding)
		containerViewTopAnchor.priority = .init(rawValue: 999)

		let containerViewBottomAnchor = containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -padding)
		containerViewBottomAnchor.priority = .init(rawValue: 999)

		NSLayoutConstraint.activate([
			containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
			containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
			containerViewTopAnchor,
			containerViewBottomAnchor
		])
	}
	
	private func setupSubviews() {
		// photo image
		photoImageView.constrainWidthToHeight()
		photoImageView.layer.setCornerRadius(10)

		// user info stacks
		let followersImageLabel = GFLabel(text: "Followers:", image: .sfSymbolPerson2, fontSize: followersCountLabel.font.pointSize, color: followersCountLabel.textColor)
		
		let followersInfoStack = HStackView([followersImageLabel, followersCountLabel], spacing: 4)
		let userInfoStack = VStackView([usernameLabel, followersInfoStack], spacing: 6, alignment: .leading)
		
		// main stack
		let stack = HStackView([photoImageView, userInfoStack], spacing: 16, alignment: .leading)
		containerView.addSubview(stack)
		stack.constrainToSuperview(padding: 9)
	}
	
	
	// MARK: - API
	
	func set(user: GithubUser) {
		usernameLabel.text = user.username
		followersCountLabel.text = String(user.followersCount)
		
		imageDownloaderSubscriber = DataManager.shared
										.profileImagePublisher(for: user)
										.assign(to: \.image, on: photoImageView)
	}
	
	
	// MARK: - Internal methods
	
	override func setSelected(_ selected: Bool, animated: Bool) {
		super.setSelected(selected, animated: animated)
		
		containerView.backgroundColor = isSelected ? .gfFavoriteCellSelected : .gfFavoriteCell
	}
	
	override func prepareForReuse() {
		super.prepareForReuse()
		
		imageDownloaderSubscriber?.cancel()

		photoImageView.image = nil
		usernameLabel.text = ""
		followersCountLabel.text = ""
	}
}
