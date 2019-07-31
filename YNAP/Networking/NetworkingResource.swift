//
//  NetworkingResource.swift
//  YNAP
//
//  Created by Elliott D'Alvarez on 24/07/2019.
//  Copyright © 2019 EJD. All rights reserved.
//

import Foundation

// A webservice resource.
public struct Resource<T: Decodable> {
    // Endpoint we'll be fetching the data from, starting with a forward slash.
    let endpoint: String
    // HTTP method to use.
    let method: HttpMethod
    // Query paramenters.
    let queryParameters: [String: String?]? = nil
    // Tells the webservice how to decode the data.
    let decoder: (Data) throws -> T
}

extension Resource {

    // MARK: Constructors

    // Initialises a resource struct that decodes the data using `JSONDecoder`.
    init(endpoint: String,
         method: HttpMethod = .get) {

        let decoder: (Data) throws -> T = { data in
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            return try decoder.decode(T.self, from: data)
        }

        self.init(endpoint: endpoint,
                  method: method,
                  decoder: decoder)
    }
}
