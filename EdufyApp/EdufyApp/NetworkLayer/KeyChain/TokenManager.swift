//
//  TokenManager.swift
//  EdufyApp
//
//  Created by Durdana on 01.03.26.
//

import Foundation

final class TokenManager {
    
    static let shared = TokenManager()
    
    private let keychain = KeychainManager.shared
    
    private enum Keys {
        static let accessToken = "edufy_access_token"
        static let refreshToken = "edufy_refresh_token"
    }
    
    private init() {}
    
    // MARK: - Access Token
    var accessToken: String? {
        keychain.read(key: Keys.accessToken)
    }
    
    func saveAccessToken(_ token: String) {
        keychain.save(key: Keys.accessToken, value: token)
    }
    
    // MARK: - Refresh Token
    var refreshToken: String? {
        keychain.read(key: Keys.refreshToken)
    }
    
    func saveRefreshToken(_ token: String) {
        keychain.save(key: Keys.refreshToken, value: token)
    }
    
    
    func saveTokens(access: String, refresh: String) {
        saveAccessToken(access)
        saveRefreshToken(refresh)
    }
    
  
    var isLoggedIn: Bool {
        accessToken != nil
    }
    
    
    func clearTokens() {
        keychain.delete(key: Keys.accessToken)
        keychain.delete(key: Keys.refreshToken)
    }
}
