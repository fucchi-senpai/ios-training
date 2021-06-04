//
//  WeatherViewControllerTests.swift
//  WeatherViewControllerTests
//
//  Created by Shota Fuchikami on 2021/05/25.
//

import XCTest
@testable import iOSTraining

class WeatherViewControllerTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testWeatherImageView() throws {
        XCTContext.runActivity(named: "天候画像の表示内容を確認", block: { _ in
            XCTContext.runActivity(named: "天気予報がsunnyの場合、晴れの画像が表示されているか", block: { _ in
                let model = WeatherModelSunnyTest()
                let vc = WeatherViewController(weatherModel: model)
                vc.view.layoutIfNeeded()
                vc.loadWeather()
                self.setTimeout(with: 0.5) {
                    let expected = UIImage(named: "icon_sunny")?.withRenderingMode(.alwaysTemplate)
                    let actual = vc.weatherImageView.image
                    XCTAssertEqual(expected, actual)
                }
            })
            
            XCTContext.runActivity(named: "天気予報がcloudyの場合、曇りの画像が表示されているか", block: { _ in
                let model = WeatherModelCloudyTest()
                let vc = WeatherViewController(weatherModel: model)
                vc.view.layoutIfNeeded()
                vc.loadWeather()
                self.setTimeout(with: 0.5) {
                    let expected = UIImage(named: "icon_cloudy")?.withRenderingMode(.alwaysTemplate)
                    let actual = vc.weatherImageView.image
                    XCTAssertEqual(expected, actual)
                }
            })
            
            XCTContext.runActivity(named: "天気予報がrainyの場合、雨の画像が表示されているか", block: { _ in
                let model = WeatherModelRainyTest()
                let vc = WeatherViewController(weatherModel: model)
                vc.view.layoutIfNeeded()
                vc.loadWeather()
                self.setTimeout(with: 0.5) {
                    let expected = UIImage(named: "icon_rainy")?.withRenderingMode(.alwaysTemplate)
                    let actual = vc.weatherImageView.image
                    XCTAssertEqual(expected, actual)
                }
            })
        })
    }
    
    func testTempLabel() throws {
        XCTContext.runActivity(named: "気温ラベルの表示内容を確認", block: { _ in
            
            let model = WeatherModelTempLabelTest()
            let vc = WeatherViewController(weatherModel: model)
            
            XCTContext.runActivity(named: "最高気温が表示と一致するかどうか", block: { _ in
                vc.view.layoutIfNeeded()
                vc.loadWeather()
                self.setTimeout(with: 0.5) {
                    let expected = "20"
                    let actual = vc.maxTempLabel.text
                    XCTAssertEqual(expected, actual)
                }
            })
            
            XCTContext.runActivity(named: "最低気温が表示と一致するかどうか", block: { _ in
                vc.view.layoutIfNeeded()
                vc.loadWeather()
                self.setTimeout(with: 0.5) {
                    let expected = "-5"
                    let actual = vc.minTempLabel.text
                    XCTAssertEqual(expected, actual)
                }
            })

        })
    }
    
    private func setTimeout(with: Double, closure: @escaping () -> Void) {
        let expectation = XCTestExpectation(description: "Weather View Test")
        DispatchQueue.main.async {
            closure()
            // 非同期処理完了
            expectation.fulfill()
        }
        XCTWaiter().wait(for: [expectation], timeout: with)
    }

}

// MARK: ユニットテスト用モックデータ

final class WeatherModelSunnyTest: WeatherModelProtocol {
    func fetchWeather(_ jsonString: String, closure: @escaping (Result) -> Void) {
        let result = Result(data: Result.WeatherData(weather: Weather.sunny.rawValue, maxTemp: 0, minTemp: 0, date: ""), responseStatus: .success)
        closure(result)
    }
}

final class WeatherModelCloudyTest: WeatherModelProtocol {
    func fetchWeather(_ jsonString: String, closure: @escaping (Result) -> Void) {
        let result = Result(data: Result.WeatherData(weather: Weather.cloudy.rawValue, maxTemp: 0, minTemp: 0, date: ""), responseStatus: .success)
        closure(result)
    }
}

final class WeatherModelRainyTest: WeatherModelProtocol {
    func fetchWeather(_ jsonString: String, closure: @escaping (Result) -> Void) {
        let result = Result(data: Result.WeatherData(weather: Weather.rainy.rawValue, maxTemp: 0, minTemp: 0, date: ""), responseStatus: .success)
        closure(result)
    }
}

final class WeatherModelTempLabelTest: WeatherModelProtocol {
    func fetchWeather(_ jsonString: String, closure: @escaping (Result) -> Void) {
        let result = Result(data: Result.WeatherData(weather: Weather.sunny.rawValue, maxTemp: 20, minTemp: -5, date: ""), responseStatus: .success)
        closure(result)
    }
}
