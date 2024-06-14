//
//  HandleResponse.swift
//  DataStore
//
//  Created by Eldiiar on 17/5/24.
//

import Foundation
import Moya

protocol HandleResponseProtocol{
    func handleResponse<T: Decodable>(result: Result<Response, MoyaError>, onSuccess: @escaping (T) -> Void, onError: @escaping (APIError) -> Void)
}

class HandleResponse: HandleResponseProtocol{
    func handleResponse<T: Decodable>(result: Result<Response, MoyaError>, onSuccess: @escaping (T) -> Void, onError: @escaping (APIError) -> Void) {
        switch result {
        case let .success(response):
            do {
                
                handleStatusCode(statusCode: response.statusCode) {(error) in
                    onError(error)
                    return
                }
                
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                let decoded = try response.map(T.self, atKeyPath: nil, using: decoder, failsOnEmptyData: false)
                onSuccess(decoded)
            } catch {
                onError(.data)
            }
        case let .failure(error):
            switch error {
            case let .statusCode(response):
                handleStatusCode(statusCode: response.statusCode, onError: onError)
            default: onError(.network)
            }
        }
    }
    
    func handleStatusCode(statusCode: Int, onError: @escaping (APIError) -> Void) {
        switch statusCode {
        case 200..<300: break
        case 405: onError(.custom("The same data"))
        case 404: onError(.notFound)
        case 500..<600: onError(.server)
        case 401:onError(.unauthorized)
        default: onError(.network)
        }
    }
}

public enum APIError: Error {
    case data
    case unauthorized
    case notFound
    case server
    case network
    case numberNotActive
    case emailAndPassword
    case otpCode
    case fillTheField
    case biometricAuthFailed
    case fillAllRequiredFields
    case fillInNewEmail
    case custom(String)
    case privacyPolicyAndUserAgreement
    case pinCodesDoesntMatch
    case salariesSumNotLessThanSalaryCup
}

extension APIError: Equatable{}
