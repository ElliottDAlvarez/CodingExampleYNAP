//
//  HttpMethod.swift
//  YNAP
//
//  Created by Elliott D'Alvarez on 24/07/2019.
//  Copyright © 2019 EJD. All rights reserved.
//

import Foundation

enum HttpMethod {
    case get
    case post(_ payload: Data?)
}

// MARK: String Value
extension HttpMethod {
    var stringValue: String {
        switch self {
        case .get:
            return "GET"
        case .post:
            return "POST"
        }
    }
}
