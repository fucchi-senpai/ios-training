//
//  Data.swift
//  iOSTraining
//
//  Created by Shota Fuchikami on 2021/05/29.
//

struct Parameter: Codable {
    var area: String
    var date: String
}

struct WeatherData: Codable {
    var weather: String
    var maxTemp: Int
    var minTemp: Int
    var date: String
    
    enum CodingKeys: String, CodingKey {
        case weather
        case maxTemp = "max_temp"
        case minTemp = "min_temp"
        case date
    }
}
