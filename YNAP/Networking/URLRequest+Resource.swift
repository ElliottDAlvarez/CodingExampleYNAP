//
//  URLRequest+Resource.swift
//  YNAP
//
//  Created by Elliott D'Alvarez on 24/07/2019.
//  Copyright © 2019 EJD. All rights reserved.
//

import Foundation

extension URLRequest {

    // Creates and initializes a URLRequest with the given resource and base URL.
    /// - Parameter resource: The resource to generate the request from.
    /// - Parameter baseURL: Base URL for the request.
    /// - Returns: An initialized URLRequest object, or `nil` in case of error.
    init?<T>(resource: Resource<T>, baseURL: URL) where T: Decodable {

        let fullURL = baseURL.appendingPathComponent(resource.endpoint)

        guard var urlComponents = URLComponents(string: fullURL.absoluteString) else {
            return nil
        }
        if let queryParams = resource.queryParameters {
            urlComponents.queryItems = queryParams.map { key, value in
                URLQueryItem(name: key, value: value)
            }
        }
        guard let url = urlComponents.url else {
            return nil
        }

        var request = URLRequest(url: url)
        request.httpMethod = resource.method.stringValue

        switch resource.method {
        case let .post(body):
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = body
            request.setValue("\(request.httpBody?.count ?? 0)", forHTTPHeaderField: "Content-Length")
        default:
            ()
        }

        self = request
    }
}
