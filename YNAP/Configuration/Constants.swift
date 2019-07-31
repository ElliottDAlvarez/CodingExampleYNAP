//
//  Constants.swift
//  YNAP
//
//  Created by Elliott D'Alvarez on 24/07/2019.
//  Copyright © 2019 EJD. All rights reserved.
//

import Foundation

// Keep all constants in one place
struct Constants {
    // MARK: Networking Constants
    struct Network {
        // Note normally ClothingURL wouldn't simply be a string without params, just for demo purposes
        static let BaseURL: String = "https://api.net-a-porter.com"
        static let ClothingURL: String = "/NAP/GB/en/60/0/summaries?categoryIds=2"
        static let Scheme: String = "https:"
    }
}
