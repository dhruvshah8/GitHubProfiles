//
//  FollowersDataSource.swift
//  GitHub+
//
//  Created by Dhruv Shah on 2020-07-25.
//  Copyright © 2020 Dhruv Shah. All rights reserved.
//

import UIKit

class FollowersDataSource: UICollectionViewDiffableDataSource<FollowersDataSource.Section, GithubFollower> {
	// MARK: - Sections
	
	enum Section {
		case followers
	}
	
	
	// MARK: - Properties

	private var followers: [GithubFollower] = []
	private var filterFollowersByNameTerm = ""
	
	var isFiltering: Bool {
		filterFollowersByNameTerm.isNotEmpty
	}
	
	var isEmpty: Bool {
		snapshot().numberOfItems == 0
	}

	typealias CellProvider = (UICollectionView, IndexPath, GithubFollower) -> UICollectionViewCell?

	private let cellProvider: CellProvider = { collectionView, indexPath, follower in
		let cell: FollowerCell = collectionView.dequeueReusableCell(for: indexPath)
		cell.set(follower: follower)
		return cell
	}
	
	
	// MARK: - Init

	init(collectionView: UICollectionView) {
		super.init(collectionView: collectionView, cellProvider: cellProvider)
	}
	
	
	// MARK: - API
	
	func add(followers newFollowers: [GithubFollower]) {
		followers.append(contentsOf: newFollowers)
		reload(with: followers)
	}
	
	func removeAll() {
		followers.removeAll()
		reload(with: [])
	}
	
	func filter(with filterTerm: String) {
		guard filterTerm != filterFollowersByNameTerm else { return }

		filterFollowersByNameTerm = filterTerm
		
		if filterTerm.isEmpty {
			reload(with: followers)
		} else {
			let filteredFollowers = followers.filter { $0.username.contains(filterTerm) }
			reload(with: filteredFollowers)
		}
	}
	
	
	// MARK: - Private methods
	
	private func reload(with followers: [GithubFollower]) {
		var snapshot = NSDiffableDataSourceSnapshot<Section, GithubFollower>()
		snapshot.appendSections([.followers])
		snapshot.appendItems(followers)

		apply(snapshot, animatingDifferences: true)
	}
}
