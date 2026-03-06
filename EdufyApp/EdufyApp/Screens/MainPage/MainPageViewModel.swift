//
//  MainPageViewModel.swift
//  EdufyApp
//
//  Created by Durdana on 13.02.26.
//

import Combine
import Foundation

@MainActor
final class MainPageViewModel: ObservableObject {
    private let networkService: NetworkService = DefaultNetworkService()
    @Published var userName: String = ""
    
    func fetchUserData() async {
        
        do {
            let response: APIResponse<HomeResponse> =
            try await networkService.request(
                HomeEndpoint.home(popularTake: 4, instructorTake: 4)
            )
            
            if response.success, let user = response.data, let name = user.greetingName {
                
                userName = name
                print("LOG: Username API-dan ugurla geldi")
                return
            }
            
        } catch {
            print("LOG: User fetch xetasi \(error), Mock Data istifade olunur")
        }
        
        userName = "Istifadeci adi"
        
    }
}
