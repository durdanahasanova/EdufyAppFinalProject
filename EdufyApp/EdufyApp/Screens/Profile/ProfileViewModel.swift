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
                //Mail
                let meResponse: APIResponse<UserData> = try await networkService.request(AuthEndpoint.me)
                if let user = meResponse.data {
                    //userName = user.displayName
                    userEmail = user.email
                }
                
                //Ad
                let nameResponse: APIResponse<HomeResponse> = try await networkService.request(HomeEndpoint.home(popularTake: 1, instructorTake: 1))
                if let user = nameResponse.data?.greetingName {
                    userName = user
                }
                
            } catch {
                print("LOG: Profile fetch xetasi - \(error)")
                userName = "İstifadəçi"
                userEmail = ""
            }
        }
    }
    
    func logout() {
        
        Task {
            if let refreshToken = TokenManager.shared.refreshToken {
                do {
                    let token: APIResponse<String?> = try await networkService.request(AuthEndpoint.logout(refreshToken))
                } catch  {
                    print("LOG: Logout API xətası - \(error)")
                }
            }
        }
        
        TokenManager.shared.clearTokens()
        didLogout = true
    }
}
