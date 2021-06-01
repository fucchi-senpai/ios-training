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
    func fetchWeather(_ jsonString: String) -> Result
}

/// APIラッパークラス
class WeatherModel: WeatherModelProtocol {
    /// ランダムで天候のJson文字列を返却する
    /// - Parameter jsonString: リクエストパラメータ文字列
    /// - Returns: レスポンスデータとステータス（成功 or 失敗）
    func fetchWeather(_ jsonString: String) -> Result {
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
