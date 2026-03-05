import Combine

final class AcademyDetailViewModel: ObservableObject {

    @Published var academy: AcademyDetail?
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    @Published var selectedProgram: Program? = nil

    private let academyId: String
    private let networkService: NetworkService = DefaultNetworkService()

    init(academyId: String) {
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
                    AcademyEndpoint.detail(id: Int(academyId) ?? 0)
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
