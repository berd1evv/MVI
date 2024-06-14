//
//  Logger.swift
//  MVI
//
//  Created by Eldiiar on 13/5/24.
//

import Foundation

protocol Logger {
    func log(_ message: String)
    func log(key: String, data: [String:Any], level: LogLevel)
    func log(_ message: String, level: LogLevel)
}

enum LogLevel {
    case info
    case error
    case warning
    case debug
}
