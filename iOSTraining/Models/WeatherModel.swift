//
//  WeatherModel.swift
//  iOSTraining
//
//  Created by Shota Fuchikami on 2021/05/27.
//

import YumemiWeather

protocol WeatherModelProtocol {
    /// ランダムで天候のJson文字列を返却する
    /// - Parameter jsonString: リクエストパラメータ文字列
    /// - Parameter closure: API実行後のコールバック処理
    func fetchWeather(_ jsonString: String, closure: @escaping (Result) -> Void)
}

/// APIラッパークラス
class WeatherModel: WeatherModelProtocol {
    /// ランダムで天候のJson文字列を返却する
    /// - Parameter jsonString: リクエストパラメータ文字列
    /// - Parameter closure: API実行後のコールバック処理
    func fetchWeather(_ jsonString: String, closure: @escaping (Result) -> Void) {
        do {
            let json = try YumemiWeather.syncFetchWeather(jsonString)
            Logging.log(message: "Fetch Success: json \(json)")
            let decodedData = JsonUtil.jsonDecode(jsonString: json)
            if let responseData = decodedData {
                let result = Result(data: responseData, responseStatus: .success)
                closure(result)
            } else {
                let result = Result(data: nil, responseStatus: .failure)
                closure(result)
            }
        } catch {
            Logging.log(message: "Error: \(error)")
            let result = Result(data: nil, responseStatus: .failure)
            closure(result)
        }
    }
    
}
