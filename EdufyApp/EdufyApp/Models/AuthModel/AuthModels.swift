//
//  AuthModels.swift
//  EdufyApp
//
//  Created by Durdana on 01.03.26.
//

import Foundation

// MARK: - Login
struct LoginRequest: Encodable {
    let email: String
    let password: String
}

struct LoginData: Decodable {
    let accessToken: String
    let refreshToken: String
    let expiresInSeconds: Int
    let requiresRoleSelection: Bool?
    let roles: [String]?
}

// MARK: - Register
struct RegisterRequest: Encodable {
    let fullName: String
    let email: String
    let password: String
}

// MARK: - Refresh Token
struct RefreshRequest: Encodable {
    let refreshToken: String
}
