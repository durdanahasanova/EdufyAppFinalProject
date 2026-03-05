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
            let response: APIResponse<UserData> =
                try await networkService.request(AuthEndpoint.me)

            if let user = response.data {
                userName = user.email
                print("LOG: Username API-dan ugurla geldi")
                return
            }

        } catch {
            print("LOG: User fetch xetasi \(error), Mock Data istifade olunur")
        }

        userName = "Istifadeci adi"

    }
}
