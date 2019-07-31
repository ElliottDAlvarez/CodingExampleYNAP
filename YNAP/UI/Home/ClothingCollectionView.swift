//
//  ClothingCollectionView.swift
//  YNAP
//
//  Created by Elliott D'Alvarez on 31/07/2019.
//  Copyright © 2019 EJD. All rights reserved.
//

import UIKit

class ClothingCollectionView: UICollectionView {

    // MARK: Properties
    var cellSpacing: CGFloat = 10.0

    var models: [ClothingViewModel] = [] {
        didSet {
            self.reloadData()
        }
    }
}

