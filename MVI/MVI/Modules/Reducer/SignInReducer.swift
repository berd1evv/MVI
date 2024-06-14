//
//  SignInReducer.swift
//  MVI
//
//  Created by Eldiiar on 8/5/24.
//

import Foundation
import Domain

class SignInReducer: Reducer {
    func reduce(currentState: inout SignInState, action: SignInAction) {
        typealias S = SignInState
        typealias A = SignInAction
        
        switch action {
        case .profileResponse(let data):
            currentState.profile = data
            currentState.route = nil
            break
        case .navigation(let destination):
            currentState.route = destination
        default:
            break
        }
    }
    
    
}
