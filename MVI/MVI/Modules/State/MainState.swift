//
//  MainState.swift
//  MVI
//
//  Created by Eldiiar on 17/5/24.
//

import Foundation
import Domain

struct MainState: ViewState, Equatable {
    
    enum MainNavigationState: String {
        case detail
        case empty
    }
    
    static func == (lhs: MainState, rhs: MainState) -> Bool {
        return lhs.mainInfo == rhs.mainInfo
    }
    
    
    var show: Bool = false
    var mainInfo: MainInfo?
    var route: MainNavigationState = .empty
}
