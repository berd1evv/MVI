//
//  AuthUseCase.swift
//  Domain
//
//  Created by Eldiiar on 17/5/24.
//

import DataStore
import Foundation

public enum AuthUseCaseProvider {

    public static func provide() -> AuthUseCase {
        return AuthUseCaseImpl(
            repository: AuthRepositoryProvider.provide(),
            translator: AuthTranslatorProvider.provide()
        )
    }
}

public protocol AuthUseCase {
    func get() -> Profile
    func getMainInfo() -> MainInfo
}

struct AuthUseCaseImpl: AuthUseCase {

    let repository: AuthRepository
    let translator: AuthTranslator

    func get() -> Profile {
        let response = self.repository.getEntity()
        let model = self.translator.convert(from: response)
        return model
    }
    
    func getMainInfo() -> MainInfo {
        let response = self.repository.getMainInfo()
        let model = self.translator.convert(from: response)
        return model
    }
}
