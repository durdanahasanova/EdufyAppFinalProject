//
//  TeacherDetailViewModel.swift
//  EdufyApp
//
//  Created by Durdana on 26.02.26.
//

import Combine
import Foundation

@MainActor
class TeacherDetailViewModel: ObservableObject {
    @Published var teacherDetail: TeacherDetail?
    @Published var isLoading = false
    @Published var errorMessage: String?

    private let networkService: NetworkService = DefaultNetworkService()
    private let teacherId: Int

    init(teacherId: Int) {
        self.teacherId = teacherId
    }

    func fetchTeacherDetail() async {
        isLoading = true

        defer {
            isLoading = false
        }

        do {
            let response: APIResponse<TeacherDetail> =
                try await networkService.request(
                    InstructorEndpoint.detail(id: teacherId, demoTake: 6)
                )

            if response.success, let data = response.data {
                teacherDetail = data
                print("LOG: Teacher detail API-dan ugurla geldi")
                print("LOG: Teacher detail - \(data.fullName), demoVideos count: \(data.demoVideos.count)")
                for video in data.demoVideos {
                    print(
                        "LOG: Video - id:\(video.id) title:\(video.title) duration:\(video.duration)"
                    )
                }

            } else {
                errorMessage = response.message ?? "Xəta baş verdi"
                print("LOG: Teacher detail xetasi - \(errorMessage ?? "")")
            }
        } catch {
            print("LOG: Teacher detail API xetasi - \(error)")
            teacherDetail = TeacherMockData.getTeacher(by: teacherId)
        }

    }

    var name: String { teacherDetail?.fullName ?? "Müəllim adı" }
    var bio: String { teacherDetail?.bio ?? "Müəllim haqqında mılumat yoxdur" }
    var monthlyPrice: String {  
        if let price = teacherDetail?.priceAzn {
            return "\(Int(price)) AZN"
        }
        return "-"
    }
    var address: String { teacherDetail?.address ?? "-" }
    var phone: String { teacherDetail?.phoneNumber ?? "-" }
    var photoUrl: String? { teacherDetail?.photoUrl }
    var demoVideos: [DemoVideo] { teacherDetail?.demoVideos ?? [] }
}
