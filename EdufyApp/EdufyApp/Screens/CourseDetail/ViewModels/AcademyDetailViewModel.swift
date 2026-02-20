
import Combine

final class AcademyDetailViewModel: ObservableObject {
    
    @Published var academy: AcademyDetail?
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    private let academyId: String
    
    init (academyId: String) {
        self.academyId = academyId
    }
    
    @MainActor
    func fetchAcademyDetail() async {
        isLoading = true
        errorMessage = nil
        defer { isLoading = false }
        
        academy = MockAcademyData.sampleAcademy
        
        //TODO: API call
        //        do {
        //            academy = try await apiService.getDetail(id: academyId)
        //        } catch {
        //            errorMessage = error.localizedDescription
        //        }
    }
    
    func onTappedProgram(_ program: Program) {
        print("Program tapped: \(program.title)")
        
    }
    
    var academyName: String {
        academy?.name ?? "Unknown Academy"
    }
    
    var logoName: String {
        academy?.logoName ?? "placeholder"
    }
    
    var aboutText: String {
        academy?.aboutText ?? "No description available."
    }
    
    var applicationCount: String {
        academy?.applicationCount ?? "-"
    }
    
    var studentCount: String {
        academy?.studentCount ?? "-"
    }
    
    var graduatePercentage: String {
        academy?.graduatePercentage ?? "-"
    }
    
    var programs: [Program] {
        academy?.programs ?? []
    }
    
    
    
}
