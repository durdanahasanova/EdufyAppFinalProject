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
    private let teacherId: String

    init(teacherId: String) {
        self.teacherId = teacherId
    }

    func fetchTeacherDetail() async {
        isLoading = true

        defer {
            isLoading = false
        }

        //        do {
        //            let response: APIResponse<TeacherDetail> = try await networkService.request(<#T##endpoint: any Endpoint##any Endpoint#>)
        //        } catch  {
        //
        //        }
        //TODO: API qosmaliyam
        teacherDetail = TeacherMockData.aysel

    }

    var name: String { teacherDetail?.name ?? "Müəllim adı" }
    var bio: String { teacherDetail?.bio ?? "Müəllim haqqında mılumat yoxdur" }
    var monthlyPrice: String { teacherDetail?.monthlyPrice ?? "-" }
    var address: String { teacherDetail?.address ?? "-" }
    var phone: String { teacherDetail?.phone ?? "-" }
    var photoUrl: String? { teacherDetail?.photoUrl }
    var demoVideos: [DemoVideo] { teacherDetail?.demoVideos ?? [] }
}
