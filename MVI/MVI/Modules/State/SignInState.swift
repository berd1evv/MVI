//
//  SignInState.swift
//  MVI
//
//  Created by Eldiiar on 8/5/24.
//

import Foundation
import Domain

enum NavigationState: String {
    case detail
    case empty
}

struct SignInState: ViewState, Equatable {
    static func == (lhs: SignInState, rhs: SignInState) -> Bool {
        return lhs.profile == rhs.profile
    }
    
    
    var profile: Profile?
    var route:NavigationState? = nil
}
