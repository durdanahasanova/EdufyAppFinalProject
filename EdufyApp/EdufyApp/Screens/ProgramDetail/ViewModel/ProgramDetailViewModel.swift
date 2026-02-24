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
    
    init(programId: String) {
        self.programId = programId
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
    
    var modules: [ProgramModule] {
        programDetail?.modules ?? []
    }
    
    var instructor: Instructor? {
        programDetail?.instructor
    }
    
    func fetchProgramDetail() async {
        isLoading = true
        
        defer {
            isLoading = false
        }
        
        programDetail = ProgramMockData.iOSProgram
        
        
        //TODO: API call
//                do {
//                    academy = try await apiService.getDetail(id: programId)
//                } catch {
//                    errorMessage = error.localizedDescription
//                }
    }
    
    
    func onTappedModule(_ module: ProgramModule) {
        print("Module tapped: \(module.title)")
        
    }
    
    func onTouchApply() {
        print("Apply for program: \(programId)")
    }
    
}
