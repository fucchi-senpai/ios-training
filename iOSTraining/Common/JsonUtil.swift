//
//  JsonUtil.swift
//  iOSTraining
//
//  Created by Shota Fuchikami on 2021/05/29.
//

import Foundation

struct JsonUtil {
    /// Jsonエンコード
    /// - Parameter param: リクエストパラメータ
    /// - Returns: エンコードしたJson文字列
    static func jsonEncode(param: Parameter) -> String? {
        do {
            let encodedData = try JSONEncoder().encode(param)
            return String(data: encodedData, encoding: .utf8)
        } catch {
            Logging.log(message: "Error: \(error)")
            return nil
        }
    }
    
    /// Jsonデコード
    /// - Parameter jsonString: Json文字列
    /// - Returns: WeatherData
    static func jsonDecode(jsonString: String) -> WeatherData? {
        do {
            guard let data = jsonString.data(using: .utf8) else { return nil }
            let decodedData = try JSONDecoder().decode(WeatherData.self, from: data)
            return decodedData
        } catch {
            Logging.log(message: "Error: \(error)")
            return nil
        }
    }
}
