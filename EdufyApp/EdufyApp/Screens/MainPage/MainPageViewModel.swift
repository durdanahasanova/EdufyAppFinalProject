//
//  MainPageViewModel.swift
//  EdufyApp
//
//  Created by Durdana on 13.02.26.
//

import Foundation
import Combine

@MainActor
final class MainPageViewModel: ObservableObject {
    private let networkService: NetworkService = DefaultNetworkService()
    @Published var userName: String = ""
    
    func fetchUserData() async {
        Task {
            do {
                let response: APIResponse<UserData> = try await networkService.request(AuthEndpoint.me)
                
                if let user = response.data{
                    userName = user.email
                }
                    
            } catch {
                print("LOG: User fetch xetasi \(error)")
                userName = "Istifadeci adi"
            }
        }
    }
}
