//
//  ClothingListViewModelTests.swift
//  YNAPTests
//
//  Created by Elliott D'Alvarez on 31/07/2019.
//  Copyright © 2019 EJD. All rights reserved.
//

import XCTest
@testable import YNAP

class ClothingListViewModelTests: XCTestCase {

    // MARK: Test lifecycle
    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func test_clothing_list_get() {
        let expect = expectation(description: "clothing model")
        let service = NetworkingService(baseURL: URL(string: Constants.Network.BaseURL)!)
        let clothingListViewModel = ClothingListViewModel(service: service)
        clothingListViewModel.get { (clothingListModel) in
            guard let _ = clothingListModel else {
                XCTFail("Error: No clothing model returned")
                return
            }
            expect.fulfill()
        }
        wait(for: [expect], timeout: 3.0)
    }

    func test_clothing_list_get_has_models() {
        let expect = expectation(description: "clothing model")
        let service = NetworkingService(baseURL: URL(string: Constants.Network.BaseURL)!)
        let clothingListViewModel = ClothingListViewModel(service: service)
        clothingListViewModel.get { (clothingListModel) in
            guard let clothingModels = clothingListModel?.clothingViewModels else {
                XCTFail("Error: No clothing model returned")
                return
            }
            if clothingModels.count != 0 {
                expect.fulfill()
            } else {
                XCTFail("Error: No clothing models returned")
            }
        }
        wait(for: [expect], timeout: 3.0)
    }
}
