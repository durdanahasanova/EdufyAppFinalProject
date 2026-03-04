//
//  ProgramDetailViewModel.swift
//  EdufyApp
//
//  Created by Durdana on 24.02.26.
//

import Combine
import Foundation

@MainActor
class ProgramDetailViewModel: ObservableObject {

    private let networkService: NetworkService = DefaultNetworkService()
    private let programId: Int

    @Published var isLoading = false
    @Published var errorMessage: String?
    @Published var programDetail: ProgramDetail?
    @Published var expandedModuleId: String? = nil

    //Application ucun
    @Published var hasApplied: Bool = false
    @Published var isSubmitting: Bool = false
    @Published var submitError: String? = nil
    @Published var showApplicationForm: Bool = false

    var modules: [ProgramModule] {
        programDetail?.modules ?? []
    }

    init(programId: Int) {
        self.programId = programId
    }

    func fetchProgramDetail() async {
        isLoading = true

        defer {
            isLoading = false
        }

        programDetail = ProgramMockData.iOSProgram

        do {
            let response: APIResponse<ProgramDetail> =
                try await networkService.request(
                    ProgramEndpoint.detail(id: programId)
                )

            if response.success, let data = response.data {
                programDetail = data
                print("LOG: Program detail API-dan ugurla geldi")
            }
        } catch {
            print(
                "LOG: API sorun oldu \(error), Program detail Mock datadan geldi"
            )
        }
        programDetail = ProgramMockData.iOSProgram
    }

    func tapModule(_ id: String) {
        if expandedModuleId == id {
            expandedModuleId = nil
        } else {
            expandedModuleId = id
        }
    }

    func isExpanded(_ id: String) -> Bool {
        expandedModuleId == id
    }

    func submitApplication(firstname: String, lastname: String, phone: String)
        async
    {
        isSubmitting = true
        defer {
            isSubmitting = false
        }

        let request = ApplicationRequest(
            programId: programId,
            firstName: firstname,
            lastName: lastname,
            phone: phone
        )

        do {
            let response: APIResponse<ApplicationResponse> =
                try await networkService.request(
                    ApplicationEndpoint.apply(request)
                )

            if response.success {
                hasApplied = true
                print("LOG: Muraciet API ile ugurlu oldu")
            } else {
                submitError = response.message ?? "Müraciət uğursuz oldu"
            }
        } catch {
            print(
                "LOG: Api xetasi bas verdi \(error), Mock rejim ucun ugurlu sayilir"
            )
            hasApplied = true
        }

    }

    var logoName: String {
        programDetail?.logoName ?? "person"
    }

    var programName: String {
        programDetail?.name ?? "Program adi"
    }

    var aboutText: String {
        programDetail?.description ?? "Melumat yoxdur"
    }

    var duration: String {
        programDetail?.duration ?? "- ay"

    }

    var groupSize: String {
        programDetail?.groupSize ?? "- nefer"

    }

    //    var modules: [ProgramModule] {
    //        programDetail?.modules ?? []
    //    }

    var instructor: Instructor? {
        programDetail?.instructor
    }

}
