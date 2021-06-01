//
//  WeatherData.swift
//  iOSTraining
//
//  Created by Shota Fuchikami on 2021/05/29.
//

struct Parameter: Encodable {
    var area: String
    var date: String
}

struct Result {
    var data: WeatherData? = nil
    var responseStatus: ResponseStatus = .notRequest

    struct WeatherData: Decodable {
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
}

enum ResponseStatus {
    case success
    case failure
    case notRequest
}
