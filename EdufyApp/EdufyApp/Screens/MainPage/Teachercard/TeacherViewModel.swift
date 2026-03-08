//
//  TeacherViewModel.swift
//  EdufyApp
//
//  Created by Durdana on 16.02.26.
//

import Combine
import SwiftUI

@MainActor
class TeacherViewModel: ObservableObject {

    @Published var teachers: [Teacher] = []
    @Published var isLoading = false
    private let networkService: NetworkService = DefaultNetworkService()
    @Published var searchText: String = ""
   

    func fetchTeachers(search: String = " ") async {

        isLoading = true

        defer {
            isLoading = false
        }

        do {
            let response: APIResponse<HomeResponse> =
                try await networkService.request(
                    HomeEndpoint.home(popularTake: 5, instructorTake: 5, search: search)
                )

            if response.success, let data = response.data,
                let instructors = data.instructors
            {
                teachers = instructors
                print("LOG: Teacher API-dan ugurla geldi")
                return
            }
        } catch {
            print("LOG: Fetch error: \(error), Mock data istifade olundu")
        }

       

    }


}
