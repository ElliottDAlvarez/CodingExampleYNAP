//
//  ClothingModelMock.swift
//  YNAPTests
//
//  Created by Elliott D'Alvarez on 24/07/2019.
//  Copyright © 2019 EJD. All rights reserved.
//

import Foundation

extension ClothingModel {
    static func genericClothingModel() -> ClothingModel {
        return ClothingModel(id: 100, name: "test", price: ClothingModel.PriceModel(currency: "GBP", divisor: 100, amount: 1000), images: ClothingModel.ImageModel(shots: ["test_shot"], sizes: ["test_sizes"], mediaType: "image/jpeg", urlTemplate: "{{scheme}}//cache.net-a-porter.com/images/products/1144688/1144688_{{shot}}_{{size}}.jpg"))
    }
}
