//
//  Action.swift
//  MVI
//
//  Created by Eldiiar on 8/5/24.
//

import Foundation

protocol Action: Equatable {
    var description: String { get }
}
