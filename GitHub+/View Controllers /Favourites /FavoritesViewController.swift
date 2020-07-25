//
//  FavoritesViewController.swift
//  GitHub+
//
//  Created by Dhruv Shah on 2020-07-25.
//  Copyright © 2020 Dhruv Shah. All rights reserved.
//

import UIKit

class FavoritesViewController: UITableViewController {
	// MARK: - Properties
	
	private lazy var dataSource = createDataSource()

	
	// MARK: - Init
	
	init() {
		super.init(nibName: nil, bundle: nil)
		
		title = "Favorites"

		setupTabBar()
		setupNavigationBar()
		setupToolbar()
		setupTableView()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
	// MARK: - Create
	
	private func createDataSource() -> FavoritesDataSource {
		FavoritesDataSource(tableView: tableView, cellProvider: { tableView, indexPath, user -> UITableViewCell? in
			
			let cell: FavoriteCell = tableView.dequeueReusableCell(for: indexPath)
			cell.set(user: user)
			return cell
		})
	}
	
	
	// MARK: - Setup
	
	private func setupTabBar() {
		tabBarItem.image = .sfSymbolStarFill
	}
	
	private func setupNavigationBar() {
		navigationItem.rightBarButtonItem = editButtonItem
	}
	
	private func setupToolbar() {
		toolbarItems = [
			UIBarButtonItem(customView: GFLabel(text: "Sort by name: ")),
			UIBarButtonItem(image: .sfSymbolChevronDown, style: .plain, target: dataSource, action: #selector(FavoritesDataSource.sortAscending)),
			UIBarButtonItem(image: .sfSymbolChevronUp, style: .plain, target: dataSource, action: #selector(FavoritesDataSource.sortDescending))
		]
	}
	
	private func setupTableView() {
		dataSource.delegate = self
		tableView.register(FavoriteCell.self)
		tableView.separatorStyle = .none
		tableView.rowHeight = 100
	}
	
	
	// MARK: - Methods
	
	override func setEditing(_ editing: Bool, animated: Bool) {
		super.setEditing(editing, animated: animated)
		
		// show toolbar only in editing mode
		navigationController?.setToolbarHidden(!editing, animated: true)
	}
	
	private func checkForEmptyState() {
		let isEmpty = dataSource.isEmpty

		// disable edit button and hide toolbar
		navigationItem.rightBarButtonItem?.isEnabled = !isEmpty

		if isEditing, isEmpty {
			setEditing(false, animated: true)
		}

		// show empty state view
		let emptyStateText = "No favorite users. Set user as favorite on user info page by pressing ⭐️ icon."
		let emptyStateView = isEmpty ? GFEmptyStateView(text: emptyStateText) : nil
		tableView.setAsBackgroundView(emptyStateView)
	}
	
	
	// MARK: - View lifecycle
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)

		navigationController?.navigationBar.prefersLargeTitles = true

		dataSource.reloadData()
		setEditing(false, animated: false)
		checkForEmptyState()
	}
}


// MARK: - UITableViewDelegate

extension FavoritesViewController {

	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		guard let user = dataSource.itemIdentifier(for: indexPath) else { return }
		
		let followersVC = FollowersViewController(for: user)
		navigationController?.pushViewController(followersVC, animated: true)
	}
	
	override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
		
		let removeFromFavoritesAction = UIContextualAction(style: .destructive, title: "Remove") { _, _, completion in
			self.dataSource.tableView(tableView, commit: .delete, forRowAt: indexPath)
			completion(true)
		}
		removeFromFavoritesAction.image = .sfSymbolStarSlash

		return UISwipeActionsConfiguration(actions: [removeFromFavoritesAction])
	}
}


// MARK: - FavoritesDataSourceDelegate

extension FavoritesViewController: FavoritesDataSourceDelegate {
	func didDelete(_ user: GithubUser) {
		checkForEmptyState()
	}
}
