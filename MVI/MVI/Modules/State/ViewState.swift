//
//  State.swift
//  MVI
//
//  Created by Eldiiar on 8/5/24.
//

import Foundation

protocol ViewState: Equatable {
    var rawValue: String { get }
}

extension ViewState {
    
    var rawValue: String {
        return self.stringValue()
    }
    
    func stringValue() -> String {
        let mirror = Mirror(reflecting: self)
        var result = ""
        
        for case let (label?, value) in mirror.children {
            result += "\(label): \(value), "
        }
        
        // Remove the trailing comma and space
        if result.hasSuffix(", ") {
            result = String(result.dropLast(2))
        }
        
        return result
    }
}
