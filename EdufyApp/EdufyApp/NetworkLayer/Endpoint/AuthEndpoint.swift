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
    case logout(String)
    case me
    case forgotPassword(String)
    case resetPassword(String, String, String)
    
    var path: String {
        switch self {
            
        case .login:
            return "/api/auth/login"
        case .register:
            return "/api/auth/register"
        case .refresh:
            return "/api/auth/refresh"
        case .logout:
            return "/api/auth/logout"
        case .me:
            return "/api/auth/me"
        case .forgotPassword:
             return "/api/auth/forgot-password"
        case .resetPassword:
            return "/api/auth/reset-password"
        }
    }
    
    var method: HttpMethod {
        switch self {
        case .login, .register, .refresh, .logout, .forgotPassword, .resetPassword:
            return .post
        case .me:
            return .get
        }
    }
    
    var headers: [String : String]? {
        var headers = ["Content-Type": "application/json"]
        switch self {
        case .logout, .me:
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
            
        case .logout(let token):
            return RefreshRequest(refreshToken: token)
            
        case .me:
            return nil
        case .forgotPassword(let email):
            return ForgotPasswordRequest(email: email)
        case .resetPassword(let email, let code, let newPassword):
            return ResetPasswordRequest(email: email, code: code, newPassword: newPassword)
        }
        
    }
 
}


