//
//  DataManager.swift
//  GitHub+
//
//  Created by Dhruv Shah on 2020-07-25.
//  Copyright © 2020 Dhruv Shah. All rights reserved.
//

import UIKit
import Combine

class DataManager {
	// MARK: - Properties
	
	static let shared = DataManager()
	
	private let persistentManager = PersistentManager()
	private let networkManager = NetworkManager()
	
	private let baseUrl = URL(string: "https://api.github.com")
	private lazy var usersUrl = baseUrl?.appendingPath("users")
	private let usersPerRequest = 50

	
	// MARK: - Init
	
	private init() {}

	
	// MARK: - API Users
	
	func getUser(by username: String,
				 on completionQueue: DispatchQueue = .main,
				 completion: @escaping (Result<GithubUser, NetworkError>) -> Void) {
		
		let url = usersUrl?.appendingPath(username)
		
		networkManager.getParsedData(from: url) { result in
			completionQueue.async {
				completion(result)
			}
		}
	}
	
	func getFollowers(for username: String,
					  url: URL? = nil,
					  on completionQueue: DispatchQueue = .main,
					  completion: @escaping (Result<NetworkParsedResult<[GithubFollower]>, NetworkError>) -> Void) {
		
		// if no url were provided, construct request url from username in following format:
		// baseUsersUrl/%username%/followers?per_page=n
		let url = url ?? usersUrl?.appendingPath(username, "followers").appendingQuery("per_page", value: usersPerRequest)
			
		networkManager.getNetworkParsedResult(from: url) { result in
			completionQueue.async {
				completion(result)
			}
		}
	}
	
	func getProfileImage(for githubProfile: GithubProfile,
						 on completionQueue: DispatchQueue = .main,
						 completion: @escaping (Result<UIImage, NetworkError>) -> Void) {
		
		let url = githubProfile.profileImageUrl

		networkManager.getImage(from: url) { result in
			completionQueue.async {
				completion(result)
			}
		}
	}
	
	func profileImagePublisher(for githubProfile: GithubProfile,
							   on completionQueue: DispatchQueue = .main) -> AnyPublisher<UIImage?, Never> {

		Future<UIImage?, Never> { promise in
			self.getProfileImage(for: githubProfile, on: completionQueue) { result in
				switch result {
				case .success(let image):
					promise(.success(image))
				case .failure:
					promise(.success(.assetAvatarPlaceholder))
				}
			}
		}.eraseToAnyPublisher()
	}
	
	
	// MARK: - API Favorites
	
	private func save(_ favorites: [GithubUser]) {
		persistentManager.set(value: favorites, to: .favorites)
	}
	
	var allFavorites: [GithubUser] {
		persistentManager.get(type: [GithubUser].self, from: .favorites) ?? []
	}
	
	func checkIfFavorite(user: GithubUser) -> Bool {
		allFavorites.contains(user)
	}
	
	func addToFavorites(_ user: GithubUser) {
		var favorites = allFavorites
		
		guard !favorites.contains(user) else { return }
		
		favorites.append(user)
		save(favorites)
	}
	
	func removeFromFavorites(_ user: GithubUser) {
		var favorites = allFavorites
		
		favorites.removeAll { $0 == user }
		save(favorites)
	}
	
	func sortFavorites(by sortingPredicate: (GithubUser, GithubUser) -> Bool) {
		let sortedFavorites = allFavorites.sorted(by: sortingPredicate)
		save(sortedFavorites)
	}
	
	func moveFavorite(from sourceIndex: Int, to destinationIndex: Int) {
		var favorites = allFavorites
		
		let movedUser = favorites.remove(at: sourceIndex)
		favorites.insert(movedUser, at: destinationIndex)
		
		save(favorites)
	}
}
