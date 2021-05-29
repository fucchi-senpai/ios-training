//
//  Logging.swift
//  iOSTraining
//
//  Created by Shota Fuchikami on 2021/05/29.
//
import Foundation

class Logging {
    /// デバッグ時ログ出力
    /// - Parameters:
    ///   - message: ログメッセージ
    ///   - file: 実行ファイル
    ///   - line: 実行行数
    ///   - function: 実行関数名
    static func log(message: String, file: String = #file, line: Int = #line, function: String = #function) {
        #if DEBUG
        let fileName = URL(fileURLWithPath: file).lastPathComponent
        print("\(fileName) L\(line): \(function): \(message)")
        #endif
    }
}
