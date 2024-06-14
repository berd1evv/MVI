//
//  SignInAction.swift
//  MVI
//
//  Created by Eldiiar on 8/5/24.
//

import Foundation
import Domain

enum SignInAction: Action {
    static func == (lhs: SignInAction, rhs: SignInAction) -> Bool {
        switch (lhs, rhs) {
        case (.getProfile, .getProfile):
            return true
        case (.profileResponse(let lhsData), .profileResponse(let rhsData)):
            return lhsData == rhsData
        case (.navigation(let lhsData), .navigation(let rhsData)):
            return lhsData == rhsData
        default:
            return false
        }
    }
    
    case getProfile
    case profileResponse(data: Profile)
    case navigation(destination: NavigationState?)
    
    var description: String {
        switch self {
        case .getProfile:
            "Get profile"
        case .profileResponse(let data):
            "Profile response \(data)"
        case .navigation(let destination):
            "Navigate \(destination?.rawValue ?? "")"
        }
    }
}
