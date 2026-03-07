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

    func fetchTeachers() async {

        isLoading = true

        defer {
            isLoading = false
        }

        do {
            let response: APIResponse<HomeResponse> =
                try await networkService.request(
                    HomeEndpoint.home(popularTake: 5, instructorTake: 5)
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

        //teachers = TeacherViewModel.mockTeachers

    }

//    static let mockTeachers: [Teacher] = TeacherMockData.all.map { detail in
//        Teacher(
//            id: detail.id,
//            photoUrl: detail.photoUrl ?? "",
//            fullName: detail.fullName,
//            specialization: detail.specialization,
//            priceAzn: Int(
//                detail.priceAzn.replacingOccurrences(of: " AZN", with: "")
//            ) ?? 0
//        )
//    }
}
