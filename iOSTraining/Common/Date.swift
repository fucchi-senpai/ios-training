//
//  Date.swift
//  iOSTraining
//
//  Created by Shota Fuchikami on 2021/05/29.
//

import Foundation

struct DateUtil {
    
    private static let dateFormatter = DateFormatter()
    
    /// 現在日付を引数のフォーマット形式に整えて文字列で返却する
    /// - Parameter format: フォーマット形式
    /// - Returns: フォーマットした日付
    static func formatDate(format: String) -> String {
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: Date())
    }
}
