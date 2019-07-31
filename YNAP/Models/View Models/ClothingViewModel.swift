//
//  HomeViewModel.swift
//  YNAP
//
//  Created by Elliott D'Alvarez on 24/07/2019.
//  Copyright © 2019 EJD. All rights reserved.
//

import Foundation

struct ClothingViewModel {
    var name: String
    var price: String
    var imageUrl: URL?
}

extension ClothingViewModel {
    init(model: ClothingModel) {
        price = "\(model.price.amount / model.price.divisor) \(model.price.currency)"
        name = model.name

        if let shot = model.images.shots.first, let size = model.images.sizes.first {
            var formattedString = model.images.urlTemplate
            formattedString = formattedString.replacingOccurrences(of: "{{scheme}}", with: Constants.Network.Scheme)
            formattedString = formattedString.replacingOccurrences(of: "{{shot}}", with: shot)
            formattedString = formattedString.replacingOccurrences(of: "{{size}}", with: size)
            imageUrl = URL(string: formattedString)
        }
    }
}
