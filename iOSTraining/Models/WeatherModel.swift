//
//  WeatherModel.swift
//  iOSTraining
//
//  Created by Shota Fuchikami on 2021/05/27.
//

import YumemiWeather

/// APIラッパークラス
class WeatherModel {
    
    /// ランダムで天候の文字列を返却する
    /// - Returns: sunny, cloudy or rainy
    static func fetchWeather() -> String {
        let weather = YumemiWeather.fetchWeather()
        Logging.log(message: weather)
        return weather
    }
    
    /// ランダムで天候の文字列を返却する
    /// エラーの場合 nil を返却する
    /// - Parameter at: where
    /// - Returns: sunny, cloudy rainy or nil
    static func fetchWeather(at: String) -> String? {
        do {
            let weather = try YumemiWeather.fetchWeather(at: at)
            Logging.log(message: "Fetch Success: weather \(weather) at \(at)")
            return weather
        } catch {
            Logging.log(message: "Error: \(error)")
            return nil
        }
    }
    
    /// ランダムで天候のJson文字列を返却する
    /// - Parameter jsonString: リクエストパラメータ文字列
    /// - Returns: レスポンスデータとステータス（成功 or 失敗）
    static func fetchWeather(_ jsonString: String) -> Result {
        do {
            let json = try YumemiWeather.fetchWeather(jsonString)
            Logging.log(message: "Fetch Success: json \(json)")
            let decodedData = JsonUtil.jsonDecode(jsonString: json)
            guard let responseData = decodedData else { return Result(data: nil, responseStatus: .failure) }
            return Result(data: responseData, responseStatus: .success)
        } catch {
            Logging.log(message: "Error: \(error)")
            return Result(data: nil, responseStatus: .failure)
        }
    }
    
}
