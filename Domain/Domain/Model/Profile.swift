//
//  Profile.swift
//  Domain
//
//  Created by Eldiiar on 13/5/24.
//

import Foundation

public struct Profile: Equatable {
    public let name: String
    public let surname: String
    
    public init(name: String, surname: String) {
        self.name = name
        self.surname = surname
    }
}
