//
//  ClothingListModel.swift
//  YNAP
//
//  Created by Elliott D'Alvarez on 31/07/2019.
//  Copyright © 2019 EJD. All rights reserved.
//

import Foundation

struct ClothingResponse: Decodable {
    var summaries: [ClothingModel] = []
}

class ClothingListViewModel {
    var clothingViewModels: [ClothingViewModel] = []
    let networkingService: NetworkingService

    init(service: NetworkingService) {
        self.networkingService = service
    }
}

extension ClothingListViewModel {
    // MARK: Network requests
    func get(completion: @escaping (ClothingListViewModel?) -> Void) {
        let resource = Resource<ClothingResponse>(endpoint: Constants.Network.ClothingURL, method: .get)
        networkingService.load(resource) { [weak self] (clothingResponse, error) in

            guard let clothingModels = clothingResponse?.summaries else {
                print("Error: \(String(describing: error))")
                return
            }
            self?.clothingViewModels = clothingModels.map { ClothingViewModel(model: $0) }
            completion(self)
        }
    }
}
