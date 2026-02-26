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
    
    @Published var isLoading = false
    @Published var errorMessage: String?
    @Published var programDetail: ProgramDetail?
    private let programId: String
    @Published var expandedModuleId: String? = nil
    
    //Application ucun
    @Published var hasApplied: Bool = false
    @Published var isSubmitting: Bool = false
    @Published var submitError: String? = nil
    @Published var showApplicationForm: Bool = false
    
    var modules: [ProgramModule] {
        programDetail?.modules ?? []
    }
    
    init(programId: String) {
        self.programId = programId
    }
    
    func fetchProgramDetail() async {
        isLoading = true
        
        defer {
            isLoading = false
        }
        
        programDetail = ProgramMockData.iOSProgram
        
        
//        TODO: API call
//        do {
//            academy = try await apiService.getDetail(id: programId)
//        } catch {
//            errorMessage = error.localizedDescription
//        }
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
    
    
    func submitApplication(firstname: String, lastname: String, phone: String) async {
        isSubmitting = true
        defer {
            isSubmitting = false
        }
        
        try? await Task.sleep(nanoseconds: 1_000_000_000)
        hasApplied = true
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
