//
//  SentryLogger.swift
//  MVI
//
//  Created by Eldiiar on 13/5/24.
//

import Foundation

class SentryLogger: Logger {
    func log(_ message: String) {
        print("Log", message)
    }
    
    func log(key: String, data: [String : Any], level: LogLevel) {
        print("Log", key, data, level)
    }
    
    func log(_ message: String, level: LogLevel) {
        print("Log", message, level)
    }
    
    
}
