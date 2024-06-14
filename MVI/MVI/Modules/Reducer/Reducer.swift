//
//  Reducer.swift
//  MVI
//
//  Created by Eldiiar on 8/5/24.
//

import Foundation

protocol Reducer<State, Action>: AnyObject {
    associatedtype State
    associatedtype Action
    func reduce(currentState: inout State, action: Action)
}
