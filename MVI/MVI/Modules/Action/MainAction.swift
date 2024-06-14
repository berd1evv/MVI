//
//  MainAction.swift
//  MVI
//
//  Created by Eldiiar on 17/5/24.
//

import Foundation
import Domain

enum MainAction: Action {
    static func == (lhs: MainAction, rhs: MainAction) -> Bool {
        switch (lhs, rhs) {
        case (.getMainInfo, .getMainInfo):
            return true
        case (.mainInfoResponse(let lhsData), .mainInfoResponse(let rhsData)):
            return true
        default:
            return false
        }
    }
    
    case getMainInfo
    case mainInfoResponse(data: MainInfo)
    
    var description: String {
        switch self {
        case .getMainInfo:
            "Get main info"
        case .mainInfoResponse(_):
            "Main info response"
        }
    }
}
