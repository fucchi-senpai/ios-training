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
    public static func fetchWeather() -> String {
        let weather = YumemiWeather.fetchWeather()
        print(weather)
        return weather
    }
}
