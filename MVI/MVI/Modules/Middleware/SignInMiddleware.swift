//
//  SignInMiddleware.swift
//  MVI
//
//  Created by Eldiiar on 13/5/24.
//

import Foundation
import Domain

class SignInMiddleware<Action>: Middleware {
    typealias Action = SignInAction
    
    let authUseCase: AuthUseCase = AuthUseCaseProvider.provide()
    
    func process(command: SignInAction) -> SignInAction? {
        if command == .getProfile {
            return .profileResponse(data: authUseCase.get())
        }
        return nil
    }
}
