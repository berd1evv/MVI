//
//  SignInRepository.swift
//  DataStore
//
//  Created by Eldiiar on 17/5/24.
//

import Foundation
import Moya
import Alamofire

public enum AuthRepositoryProvider {

    public static func provide() -> AuthRepository {
        return AuthRepositoryImpl(provider: MoyaProvider<AuthService>(plugins: [NetworkLoggerPlugin()]), handleResponse: HandleResponse())
    }
}

public protocol AuthRepository {
    func userCheck(with phone: String, onSuccess: @escaping (Entity) -> Void, onError: @escaping (APIError) -> Void)
    func signIn(token: String, phone: String, onSuccess: @escaping (Entity) -> Void, onError: @escaping (APIError) -> Void)
    func postDevice(registrationId: String, onSuccess: @escaping (Entity) -> Void, onError: @escaping (APIError) -> Void)
    func getEntity() -> Entity
    func getMainInfo() -> MainInfoResponse
}

public class AuthRepositoryImpl {
    var provider: MoyaProvider<AuthService>
    var handleResponse: HandleResponseProtocol
    
    init(provider: MoyaProvider<AuthService>, handleResponse: HandleResponse) {
        self.provider = provider
        self.handleResponse = handleResponse
    }
}

extension AuthRepositoryImpl: AuthRepository{
    public func getEntity() -> Entity {
        return Entity(title: "Eldiiar", description: "Kudaiberdiev")
    }
    
    public func getMainInfo() -> MainInfoResponse {
        return MainInfoResponse(title: "Hello", userName: "Eldiiar Kudaiberdiev", description: "Description")
    }
    
    public func userCheck(with phone: String, onSuccess: @escaping (Entity) -> Void, onError: @escaping (APIError) -> Void){
        provider.request(.userCheck(phone: phone)) { result in
            self.handleResponse.handleResponse(result: result, onSuccess: onSuccess, onError: onError)
        }
    }
    
    public func signIn(token: String, phone: String, onSuccess: @escaping (Entity) -> Void, onError: @escaping (APIError) -> Void){
        provider.request(.signIn(token: token, phoneNumber: phone)) { result in
            self.handleResponse.handleResponse(result: result, onSuccess: onSuccess, onError: onError)
        }
    }
    
    public func postDevice(registrationId: String, onSuccess: @escaping (Entity) -> Void, onError: @escaping (APIError) -> Void){
        provider.request(.postDevice(registrationId: registrationId)) { result in
            self.handleResponse.handleResponse(result: result, onSuccess: onSuccess, onError: onError)
        }
    }
}
