//
//  ClothingModel.swift
//  YNAP
//
//  Created by Elliott D'Alvarez on 24/07/2019.
//  Copyright © 2019 EJD. All rights reserved.
//

import Foundation

struct ClothingModel: Decodable {
    struct PriceModel: Decodable {
        let currency: String
        let divisor: Int
        let amount: Int
    }
    struct ImageModel: Decodable {
        let shots: [String]
        let sizes: [String]
        let mediaType: String
        let urlTemplate: String
    }

    let id: Int
    let name: String
    let price: PriceModel
    let images: ImageModel
}
