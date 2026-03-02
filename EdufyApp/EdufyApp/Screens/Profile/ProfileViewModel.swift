//
//  ProfileViewModel.swift
//  EdufyApp
//
//  Created by Durdana on 02.03.26.
//

import Foundation
import Combine

@MainActor
final class ProfileViewModel: ObservableObject {
    
    private let networkService: NetworkService = DefaultNetworkService()
    
    @Published var userName: String = ""
    @Published var userEmail: String = ""
    @Published var showLogoutAlert = false
    @Published var didLogout = false
    
    func fetchUser() {
        Task {
            do {
                let response: APIResponse<UserData> = try await networkService.request(AuthEndpoint.me)
                if let user = response.data {
                    //userName = user.displayName
                    userEmail = user.email
                }
            } catch {
                print("LOG: Profile fetch xetasi - \(error)")
                userName = "İstifadəçi"
                userEmail = ""
            }
        }
    }
    
    func logout() {
        TokenManager.shared.clearTokens()
        didLogout = true
    }
}
