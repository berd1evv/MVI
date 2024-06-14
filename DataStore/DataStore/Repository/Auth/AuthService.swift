//
//  AuthService.swift
//  DataStore
//
//  Created by Eldiiar on 17/5/24.
//

import Foundation
import Moya

enum AuthService{
    case userCheck(phone: String)
    case signIn(token: String, phoneNumber: String)
    case postDevice(registrationId: String)
    case refreshToken(refreshToken: String)
}

extension AuthService: TargetType{
    var baseURL: URL {
        return URL(string: "https://jjsdlfs.com")!
    }
    
    var path: String {
        switch self {
        case .userCheck: return "v2/users/check-user/"
//        default: return ""
        case .signIn: return "v2/courier/sign-in/"
        case .postDevice: return "v2/devices/"
        case .refreshToken: return "token/refresh/"
        }
    }
    
    var method: Moya.Method {
        switch self{
        case .userCheck, .signIn, .postDevice, .refreshToken: return .post
//        default: return .get
        }
    }
    
    var sampleData: Data { Data() }
    
    var task: Moya.Task {
        switch self{
        case .userCheck(let phone):
            let params: [String: Any] = ["phone_number" : phone]
            return .requestParameters(parameters: params, encoding: JSONEncoding.default)
//        default: return .requestPlain
        case .signIn(let token, let phoneNumber):
            let params: [String: Any] = [
                "id_token": token
            ]
            return .requestParameters(parameters: params, encoding: JSONEncoding.default)
        case .postDevice(let registrationId):
            let params: [String: Any] = [
//                "name" : UIDevice.modelName,
                "registration_id" : registrationId,
//                "device_id" : UIDevice().getDeviceId ?? "",
                "active" : true,
                "type" : "ios",
                "app_type" : "courier_app"
            ]
            return .requestParameters(parameters: params, encoding: JSONEncoding.default)
        case .refreshToken(let refreshToken):
            let params: [String: Any] = [
                "refresh": refreshToken
            ]
            return .requestParameters(parameters: params, encoding: JSONEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .postDevice:
            return ["Authorization" : "Bearer "]
        default:
            return ["Content-type": "application/json"]
        }
    }
}
