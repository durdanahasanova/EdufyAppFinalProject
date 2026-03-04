//
//  CourseViewModel.swift
//  EdufyApp
//
//  Created by Durdana on 16.02.26.
//

import Combine
import SwiftUI

@MainActor
final class CourseViewModel: ObservableObject {
    @Published var courses: [Course] = []
    @Published var isLoading: Bool = false
    private let networkService: NetworkService = DefaultNetworkService()

    func fetchCourses() async {
        isLoading = true
        defer {
            isLoading = false
        }

        //TODO: - API qosacam
        do {
            let response: APIResponse<HomeResponse> =
                try await networkService.request(
                    HomeEndpoint.home(popularTake: 5, instructorTake: 5)
                )

            if response.success, let data = response.data,
                let academies = data.popularAcademies
            {
                courses = academies
                print("LOG: Courses API-den geldi")
                return

            }
        } catch {
            print(
                "LOG: Courses API xetasi - \(error). Mock data istifade olunur."
            )
        }

        courses = CourseViewModel.mockCourses

    }

    static let mockCourses: [Course] = [
        Course(
            id: "1",
            title: "Code Academy",
            programCount: 8,
            logoURL: "https://via.placeholder.com/120"
        ),

        Course(
            id: "2",
            title: "ABB Tech",
            programCount: 6,
            logoURL: "https://via.placeholder.com/120"
        ),
    ]
}
