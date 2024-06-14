//
//  BaseViewModel.swift
//  MVI
//
//  Created by Eldiiar on 9/5/24.
//

import Foundation

class BaseViewModel<S: ViewState, A: Action, M: Middleware>: Store<S, A, M> {
    
    func sendAction(action: A) {
        dispatch(action)
    }
}
