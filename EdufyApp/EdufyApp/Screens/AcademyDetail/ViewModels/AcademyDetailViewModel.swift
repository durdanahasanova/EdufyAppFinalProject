import Combine

final class AcademyDetailViewModel: ObservableObject {
    
    @Published var academy: AcademyDetail?
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    @Published var selectedProgram: Program? = nil
    
    private let academyId: Int
    private let networkService: NetworkService = DefaultNetworkService()
    
    init(academyId: Int) {
        self.academyId = academyId
    }
    
    @MainActor
    func fetchAcademyDetail() async {
        isLoading = true
        errorMessage = nil
        defer { isLoading = false }
        
        do {
            let response: APIResponse<AcademyDetail> =
            try await networkService.request(
                AcademyEndpoint.detail(id: academyId)
            )
            
            if response.success, let data = response.data {
                academy = data
                print("LOG: Academy detail API-dan ugurla geldi")
                return
            }
        } catch {
            print(
                "LOG: Academy Detail error: \(error), Academy detail ucun Mock Datadan istifade olundu "
            )
        }
        
        academy = MockAcademyData.sampleAcademy
        
    }
    
    func onTappedProgram(_ program: Program) {
        selectedProgram = program
        print("Program tapped: \(program.name)")
        
    }
    
    var academyName: String {
        academy?.name ?? "Unknown Academy"
    }
    
    var logoUrl: String {
        academy?.logoUrl ?? "placeholder"
    }
    
    var aboutText: String {
        academy?.about ?? "No description available."
    }
    
    var applicationCount: Int {
        academy?.totalApplications ?? 0
    }
    
    var studentCount: Int {
        academy?.totalStudents ?? 0
    }
    
    var graduatePercentage: Int {
        academy?.graduationRate ?? 0
    }
    
    var programs: [Program] {
        academy?.programs ?? []
    }
    
}
