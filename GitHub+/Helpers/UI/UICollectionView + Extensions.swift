//
//  UICollectionView + Extensions.swift
//  GitHub+
//
//  Created by Dhruv Shah on 2020-07-25.
//  Copyright © 2020 Dhruv Shah. All rights reserved.
//

import UIKit

extension UICollectionView {
	
	func register(_ cellClass: UICollectionViewCell.Type) {
		register(cellClass.self, forCellWithReuseIdentifier: cellClass.reuseId)
	}
	
	func dequeueReusableCell<T: UICollectionViewCell>(for indexPath: IndexPath) -> T {
		guard let cell = dequeueReusableCell(withReuseIdentifier: T.reuseId, for: indexPath) as? T else {
			fatalError("Can't dequeue cell of type: \(T.reuseId).")
		}
		
		return cell
	}
	
	func setAsBackgroundView(_ view: UIView?) {
		guard let view = view else {
			backgroundView = nil
			return
		}
		
		backgroundView = UIView()
		backgroundView?.addSubview(view)
		view.constrainToSuperview()
	}
}
