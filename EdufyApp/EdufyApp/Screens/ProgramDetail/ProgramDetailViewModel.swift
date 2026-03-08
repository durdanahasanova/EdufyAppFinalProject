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
    private let instructorPhotoUrl: String
    
    @Published var isLoading = false
    @Published var errorMessage: String?
    @Published var programDetail: ProgramDetail?
    @Published var expandedModuleId: Int? = nil
    
    //Application ucun
    @Published var hasApplied: Bool = false
    @Published var isSubmitting: Bool = false
    @Published var submitError: String? = nil
    @Published var showApplicationForm: Bool = false
    
    var modules: [ProgramModule] {
        programDetail?.modules ?? []
    }
    
    init(programId: Int,instructorPhotoUrl: String = "") {
        self.programId = programId
        self.instructorPhotoUrl = instructorPhotoUrl
    }
    
    func fetchProgramDetail() async {
        isLoading = true
        
        defer {
            isLoading = false
        }
        
        do {
            let response: APIResponse<ProgramDetail> =
            try await networkService.request(
                ProgramEndpoint.detail(id: programId)
            )
            
            if response.success, let data = response.data {
                programDetail = data
                print("LOG: Program detail API-dan ugurla geldi")
                return
            }
        } catch {
            print(
                "LOG: API sorun oldu \(error), Program detail Mock datadan geldi"
            )
        }
        programDetail = ProgramMockData.iOSProgram
    }
    
    func tapModule(_ id: Int) {
        if expandedModuleId == id {
            expandedModuleId = nil
        } else {
            expandedModuleId = id
        }
    }
    
    func isExpanded(_ id: Int) -> Bool {
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
            phoneNumber: phone
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
    
    
    var logoName: String { instructorPhotoUrl }
    
    var programName: String {
        programDetail?.name ?? "Program adi"
    }
    
    var aboutText: String {
        programDetail?.about ?? "Melumat yoxdur"
    }
    
    var duration: String {
        programDetail?.duration ?? "- ay"
        
    }
    
    var groupSize: String {
        programDetail?.groupSize ?? "- nefer"
        
    }
    
    var instructor: Instructor? {
        programDetail?.instructor
    }
    
}
