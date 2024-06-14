//
//  MainReducer.swift
//  MVI
//
//  Created by Eldiiar on 17/5/24.
//

import Foundation
import Domain

class MainReducer: Reducer {
    func reduce(currentState: inout MainState, action: MainAction) {
        typealias S = MainState
        typealias A = MainAction
        
        switch action {
        case .mainInfoResponse(let data):
            currentState.mainInfo = data
            break
        default:
            currentState.route = .empty
            break
        }
    }
    
    
}
