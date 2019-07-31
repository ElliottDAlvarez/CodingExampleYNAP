//
//  UIImageView+Extensions.swift
//  YNAP
//
//  Created by Elliott D'Alvarez on 24/07/2019.
//  Copyright © 2019 EJD. All rights reserved.
//

import UIKit

extension UIImageView {

    // MARK: Load from URL with image caching
    func load(url: URL?) {

        // Check we have a url and default to no_image if not
        guard let url = url else {
            self.image = UIImage(named: "no_image")
            return
        }

        // Grab the shared cache and initiate the request
        let cache = URLCache.shared
        let request = URLRequest(url: url)

        DispatchQueue.global(qos: .userInitiated).async {
            // If we have a cached request, display the stored image
            if let imageData = cache.cachedResponse(for: request)?.data {
                DispatchQueue.main.async {
                    self.image = UIImage(data: imageData)
                }
            } else {
                // If no request perform a new data task with the URL
                URLSession.shared.dataTask(with: url, completionHandler: { (responseData, response, error) in
                    // Check it's a 2xx response and we have data else set default no_image
                    guard let imageData = responseData, let httpResponse = response as? HTTPURLResponse, 200 ... 299 ~= httpResponse.statusCode else {
                        DispatchQueue.main.async {
                            self.image = UIImage(named: "no_image")
                        }
                        return
                    }

                    // If we have a response and data, cache it
                    let toCache = CachedURLResponse(response: response!, data: imageData)
                    cache.storeCachedResponse(toCache, for: request)

                    // Display the image
                    DispatchQueue.main.async {
                        self.image = UIImage(data: imageData)
                    }
                }).resume()
            }
        }
    }
}
