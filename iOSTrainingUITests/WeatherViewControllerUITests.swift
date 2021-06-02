//
//  WeatherViewControllerUITests.swift
//  WeatherViewControllerUITests
//
//  Created by Shota Fuchikami on 2021/05/25.
//

import XCTest

class WeatherViewControllerUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    
    func testWeatherImageView() throws {
        let app = XCUIApplication()
        let imageView = app.images["weatherImageView"]
        XCTAssert(imageView.exists)
    }
    
    func testTempLabel() throws {
        let app = XCUIApplication()
        let minTempLabel = app.staticTexts["minTempLabel"]
        XCTAssert(minTempLabel.exists)
        let maxTempLabel = app.staticTexts["maxTempLabel"]
        XCTAssert(maxTempLabel.exists)
    }
}
