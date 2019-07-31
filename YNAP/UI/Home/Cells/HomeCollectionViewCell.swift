//
//  HomeCollectionViewCell.swift
//  YNAP
//
//  Created by Elliott D'Alvarez on 24/07/2019.
//  Copyright © 2019 EJD. All rights reserved.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {

    // MARK: Properties
    @IBOutlet weak var nameLabel: UILabel?
    @IBOutlet weak var priceLabel: UILabel?
    @IBOutlet weak var imageV: UIImageView?

    func setup(_ model: ClothingViewModel) {
        nameLabel?.text = model.name
        priceLabel?.text = model.price
        imageV?.load(url: model.imageUrl)
    }
}
