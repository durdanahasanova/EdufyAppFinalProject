//
//  AuthEndpoint.swift
//  EdufyApp
//
//  Created by Durdana on 01.03.26.
//

import Foundation

enum AuthEndpoint: Endpoint {
    
    case login(LoginRequest)
    case register(RegisterRequest)
    case refresh(String)
    case lagout(String)
    case me
    
    var baseURL: String {
        "http://64.226.99.9:8080"
    }
    
    var path: String {
        switch self {
            
        case .login:
            return "/api/auth/login"
        case .register:
            return "/api/auth/register"
        case .refresh:
            return "/api/auth/refresh"
        case .lagout:
            return "/api/auth/logout"
        case .me:
            return "/api/auth/me"
        }
    }
    
    var method: HttpMethod {
        switch self {
        case .login, .register, .refresh, .lagout:
            return .post
        case .me:
            return .get
        }
    }
    
    var headers: [String : String]? {
        var headers = ["Content-Type": "application/json"]
        switch self {
        case .lagout, .me:
            if let token = TokenManager.shared.accessToken {
                headers["Authorization"] = "Bearer \(token)"
            }
        default:
            break
        }
        
        return headers
    }
    
    var queryItems: [URLQueryItem]? { nil }
    
    var httpBody: Encodable? {
        switch self {
        case .login(let request):
            return request
            
        case .register(let request):
            return request
            
        case .refresh(let token):
            return RefreshRequest(refreshToken: token)
            
        case .lagout(let token):
            return RefreshRequest(refreshToken: token)
            
        case .me:
            return nil
        }
        
    }
    
   
    
    
    
}
