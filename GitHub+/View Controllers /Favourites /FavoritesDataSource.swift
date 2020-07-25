//
//  FavoritesDataSource.swift
//  GitHub+
//
//  Created by Dhruv Shah on 2020-07-25.
//  Copyright © 2020 Dhruv Shah. All rights reserved.
//

import UIKit

protocol FavoritesDataSourceDelegate: class {
	func didDelete(_ user: GithubUser)
}


class FavoritesDataSource: UITableViewDiffableDataSource<FavoritesDataSource.Section, GithubUser> {
	// MARK: - Sections
	
	enum Section: Hashable {
		case favorites
	}
	
	
	// MARK: - Properties
	
	weak var delegate: FavoritesDataSourceDelegate?
	private var isLoaded = false
	
	var isEmpty: Bool {
		snapshot().numberOfItems == 0
	}
	
	
	// MARK: - API
	
	@objc func sortAscending() {
		DataManager.shared.sortFavorites(by: <)
		reloadData()
	}
	
	@objc func sortDescending() {
		DataManager.shared.sortFavorites(by: >)
		reloadData()
	}
	
	func reloadData() {
		let favorites = DataManager.shared.allFavorites
		
		guard favorites != snapshot().itemIdentifiers else { return }

		var newSnapshot = NSDiffableDataSourceSnapshot<Section, GithubUser>()
		newSnapshot.appendSections([.favorites])
		newSnapshot.appendItems(favorites)

		let animated = isLoaded // do not animate initial loading
		isLoaded = true

		apply(newSnapshot, animatingDifferences: animated)
	}
	
	
	// MARK: - Private methods
	
	private func delete(_ user: GithubUser) {
		DataManager.shared.removeFromFavorites(user)

		var newSnapshot = snapshot()
		newSnapshot.deleteItems([user])
		
		apply(newSnapshot)
	}
	
	
	// MARK: - UITableViewDataSource

	override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
		true
	}
	
	override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
		true
	}
	
	override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {

		if case .delete = editingStyle, let user = itemIdentifier(for: indexPath) {
			delete(user)
			delegate?.didDelete(user)
		}
	}
	
	override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
		
		DataManager.shared.moveFavorite(from: sourceIndexPath.item, to: destinationIndexPath.item)
		reloadData()
	}
}
