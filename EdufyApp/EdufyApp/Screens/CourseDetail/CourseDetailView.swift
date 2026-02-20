import SwiftUI

struct CourseDetailView: View {
    
    @StateObject var viewModel: AcademyDetailViewModel
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            if viewModel.isLoading {
                ProgressView()
                    .tint(.whiteHigh)
            } else if let error = viewModel.errorMessage {
                Text(error)
                    .foregroundColor(.whiteHigh)
            } else {
                contentView
            }
        }
        .navigationBarBackButtonHidden(true)
        .task {
            await viewModel.fetchAcademyDetail()
        }
    }
    
    // MARK: - Content
    private var contentView: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 20) {
                
                backButton
                
                DetailHeaderView(
                    logoName: viewModel.logoName,
                    name: viewModel.academyName
                )
                
                VStack(alignment: .leading, spacing: 40) {
                    AboutSectionView(text: viewModel.aboutText)
                    
                    StatsRowView(
                        applicationCount: viewModel.applicationCount,
                        studentCount: viewModel.studentCount,
                        graduatePercentage: viewModel.graduatePercentage
                    )
                    
                    ProgramSectionView(
                        programs: viewModel.programs
                    ) { program in
                        viewModel.onTappedProgram(program)
                    }
                }
            }
            .padding(.horizontal, 16)
        }
    }
    
    // MARK: - Back Button
    private var backButton: some View {
        Button {
            dismiss()
            print("LOG: geri qayit")
        } label: {
            Image(systemName: "arrow.left")
                .foregroundColor(.white)
                .frame(width: 28, height: 28)
            
        }
    }
        
}

#Preview {
    NavigationStack {
        CourseDetailView(
            viewModel: AcademyDetailViewModel(academyId: "1")
        )
    }
}
