//
//  AuthTranslator.swift
//  Domain
//
//  Created by Eldiiar on 17/5/24.
//

import DataStore
import Foundation

enum AuthTranslatorProvider {

    static func provide() -> AuthTranslator {
        return AuthTranslatorImpl()
    }
}

/// @mockable
protocol AuthTranslator {
    func convert(from response: Entity) -> Profile
    func convert(from response: MainInfoResponse) -> MainInfo
}

struct AuthTranslatorImpl: AuthTranslator {

    func convert(from response: Entity) -> Profile {
        return Profile(name: response.title, surname: response.description)
    }
    
    func convert(from response: MainInfoResponse) -> MainInfo {
        return MainInfo(welcomTitle: "\(response.title), \(response.userName)")
    }
}
