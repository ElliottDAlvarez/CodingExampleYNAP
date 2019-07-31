//
//  HomeViewModelTests.swift
//  YNAPTests
//
//  Created by Elliott D'Alvarez on 24/07/2019.
//  Copyright © 2019 EJD. All rights reserved.
//

import XCTest
@testable import YNAP

class ClothingViewModelTests: XCTestCase {

    // MARK: Test lifecycle
    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func test_init_with_clothing_model() {
        let clothingModel = ClothingModel.genericClothingModel()
        let homeViewModel = ClothingViewModel(model: clothingModel)

        XCTAssertEqual(homeViewModel.name,clothingModel.name)
        XCTAssertEqual(homeViewModel.price, "\(clothingModel.price.amount / clothingModel.price.divisor) \(clothingModel.price.currency)")
        XCTAssertTrue(homeViewModel.imageUrl?.absoluteString.contains("test_shot") ?? false)
        XCTAssertTrue(homeViewModel.imageUrl?.absoluteString.contains("test_sizes") ?? false)
        XCTAssertTrue(homeViewModel.imageUrl?.absoluteString.contains(Constants.Network.Scheme) ?? false)
    }
}
