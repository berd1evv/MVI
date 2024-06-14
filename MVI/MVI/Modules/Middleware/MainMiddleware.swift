//
//  MainMiddleware.swift
//  MVI
//
//  Created by Eldiiar on 17/5/24.
//

import Foundation
import Domain

class MainMiddleware<Action>: Middleware {
    
    typealias Action = MainAction
    
    let authUseCase: AuthUseCase = AuthUseCaseProvider.provide()
    
    func process(command: MainAction) -> MainAction? {
        if command == .getMainInfo {
            return .mainInfoResponse(data: authUseCase.getMainInfo())
        }
        return nil
    }
}
