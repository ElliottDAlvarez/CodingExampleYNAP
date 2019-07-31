//
//  NetworkingService.swift
//  YNAP
//
//  Created by Elliott D'Alvarez on 24/07/2019.
//  Copyright © 2019 EJD. All rights reserved.
//

import Foundation

protocol WebserviceType {
    func load<T>(_ resource: Resource<T>,
                 completion: @escaping (T?, Error?) -> Void) where T: Decodable
}

class NetworkingService: WebserviceType {

    // MARK: Properties
    private let baseURL: URL
    var session: URLSession = URLSession(configuration: .default)

    // MARK: Lifecycle
    init(baseURL: URL) {
        self.baseURL = baseURL
    }

    deinit {
        session.invalidateAndCancel()
    }

    // MARK: WebserviceType
    func load<T>(_ resource: Resource<T>, completion: @escaping (T?, Error?) -> Void) where T: Decodable {
        guard var request = URLRequest(resource: resource, baseURL: baseURL) else {
            completion(nil, NetworkingErrors.invalidRequest)
            return
        }
        request.url = URL(string: baseURL.absoluteString + resource.endpoint)

        self.perform(request, resource: resource, completion: completion)
    }

    // MARK: Private
    private func perform<T>(_ request: URLRequest,
                            resource: Resource<T>,
                            completion: @escaping (T?, Error?) -> Void) where T: Decodable {

        let task =
            session.dataTask(with: request) { responseData, response, error in
                guard let data = responseData, let httpResponse = response as? HTTPURLResponse, 200 ... 299 ~= httpResponse.statusCode else {
                    DispatchQueue.main.async {
                        completion(nil, error)
                    }
                    return
                }
                
                do {
                    let model: T = try resource.decoder(data)
                    DispatchQueue.main.async {
                        completion(model, nil)
                    }
                } catch {
                    DispatchQueue.main.async {
                        completion(nil, NetworkingErrors.decodingFailed(error: error))
                    }
                }
        }
        task.resume()
    }
}

// MARK: Networking Errors
enum NetworkingErrors: Error {
    case invalidRequest
    case decodingFailed(error: Error)
}

extension NetworkingErrors: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .invalidRequest:
            return NSLocalizedString("network.service.request.invalid", comment: "")
        case .decodingFailed(let error):
            return NSLocalizedString("network.service.response.decoding.failed", comment: "").appending(error.localizedDescription)
        }
    }
}

