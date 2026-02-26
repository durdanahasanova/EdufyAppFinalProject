import SwiftUI

struct ProgramDetailView: View {
    @StateObject var  viewModel: ProgramDetailViewModel
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            ScrollView{
                VStack(alignment: .leading, spacing: 24) {
                    backButton
                    DetailHeaderView(logoName: viewModel.logoName, name: viewModel.programName)
                    
                    AboutSectionView(text: viewModel.aboutText)
                    
                    ProgramInfoView(duration: viewModel.duration,
                                    groupSize: viewModel.groupSize)
                    
                    ForEach(viewModel.modules) { module in
                        ModuleCardView(
                            module: module,
                            isExpanded: viewModel.isExpanded(module.id),
                            onTap: { viewModel.tapModule(module.id) }
                        )
                    }
                    if let instructor = viewModel.instructor {
                        InstructorCardView(instructor: instructor)
                    }
                    
                    Buttons(
                        title: viewModel.hasApplied ? "Müraciət edilib ✓" : "Müraciət et",
                        style: viewModel.hasApplied ? .disableLargeButton : .primaryLargeButton,
                        action: { viewModel.showApplicationForm = true },
                        isEnabled: !viewModel.hasApplied
                    )
                    
                    
                }
                .padding(16)
            }
            
            .task {
                await viewModel.fetchProgramDetail()
            }
            .navigationDestination(isPresented: $viewModel.showApplicationForm) {
                ApplicationFormView(viewModel: viewModel)
            }
            
        }
        .navigationBarBackButtonHidden(true)
    }
    
    private var backButton: some View {
        Button { dismiss() } label: {
            Image(systemName: "arrow.left")
                .foregroundColor(.white)
                .frame(width: 28, height: 28)
        }
    }

}

#Preview {
    ProgramDetailView(viewModel: ProgramDetailViewModel(programId: "1"))
}

