//
//  HomeViewUITests.swift
//  YNAPUITests
//
//  Created by Elliott D'Alvarez on 24/07/2019.
//  Copyright © 2019 EJD. All rights reserved.
//

import XCTest

class HomeViewUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_collection_view_loads_and_populates() {
        let collectionViewsQuery = XCUIApplication().collectionViews
        collectionViewsQuery.cells.otherElements.containing(.staticText, identifier:"Checked merino wool sweater").element.tap()
        collectionViewsQuery/*@START_MENU_TOKEN@*/.staticTexts["Checked merino wool sweater"]/*[[".cells.staticTexts[\"Checked merino wool sweater\"]",".staticTexts[\"Checked merino wool sweater\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        collectionViewsQuery/*@START_MENU_TOKEN@*/.staticTexts["420 GBP"]/*[[".cells.staticTexts[\"420 GBP\"]",".staticTexts[\"420 GBP\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()

    }

}
