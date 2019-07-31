//
//  NetworkingServiceTests.swift
//  YNAPTests
//
//  Created by Elliott D'Alvarez on 24/07/2019.
//  Copyright © 2019 EJD. All rights reserved.
//

import XCTest
@testable import YNAP

class NetworkingServiceTests: XCTestCase {

    var sut: NetworkingService!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = NetworkingService(baseURL: URL(string: Constants.Network.BaseURL)!)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
    }

    // MARK: Tests

    func test_load() {
        let resource = Resource<ClothingResponse>(endpoint: Constants.Network.ClothingURL, method: .get)
        XCTAssertTrue(resource.endpoint.contains(Constants.Network.ClothingURL))

        let expect = expectation(description: "clothing models returned")

        sut.load(resource) { (clothingResponse, error) in

            if let error = error {
                XCTFail(error.localizedDescription)
                return
            } else {
                let clothingModels = clothingResponse?.summaries
                if clothingModels?.count != 0 {
                    expect.fulfill()
                } else {
                    XCTFail("Error: Clothing models returned: \(String(describing: clothingModels?.count))")
                    return
                }
            }
        }

        wait(for: [expect], timeout: 3.0)
    }
}
