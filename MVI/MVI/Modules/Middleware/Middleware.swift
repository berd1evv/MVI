//
//  Middleware.swift
//  MVI
//
//  Created by Eldiiar on 13/5/24.
//

import Foundation

protocol Middleware<Action> {
    associatedtype Action
    func process(command: Action) -> Action?
}
