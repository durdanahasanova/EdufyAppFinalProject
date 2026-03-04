//
//  TeacherViewModel.swift
//  EdufyApp
//
//  Created by Durdana on 16.02.26.
//

import Combine
import SwiftUI

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
            }
        } catch {
            print("LOG: Fetch error: \(error), Mock data istifade olundu")
        }

        teachers = TeacherViewModel.mockTeachers

    }

    static let mockTeachers: [Teacher] = [
        Teacher(
            id: "1",
            photoUrl: "https://via.placeholder.com/120",
            fullName: "Durdana Hasanova",
            subject: "IOS Develooper",
            price: 120
        ),

        Teacher(
            id: "2",
            photoUrl: "https://via.placeholder.com/120",
            fullName: "Murad Hasanov",
            subject: "IOS Develooper",
            price: 120
        ),

        Teacher(
            id: "3",
            photoUrl: "https://via.placeholder.com/120",
            fullName: "Durdana Hasanova",
            subject: "IOS Develooper",
            price: 120
        ),

        Teacher(
            id: "4",
            photoUrl: "https://via.placeholder.com/120",
            fullName: "Durdana Hasanova",
            subject: "IOS Develooper",
            price: 120
        ),

        Teacher(
            id: "5",
            photoUrl: "https://via.placeholder.com/120",
            fullName: "Durdana Hasanova",
            subject: "IOS Develooper",
            price: 120
        ),

        Teacher(
            id: "6",
            photoUrl: "https://via.placeholder.com/120",
            fullName: "Durdana Hasanova",
            subject: "IOS Develooper",
            price: 120
        ),

    ]

}
