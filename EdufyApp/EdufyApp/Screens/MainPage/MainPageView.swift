

import SwiftUI

struct MainPageView: View {
    
    @StateObject private var viewModel = MainPageViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.background.ignoresSafeArea()
                
                ScrollView{
                    
                    VStack(alignment: .leading, spacing: 28) {
                        
                        Text("Salam \n\(viewModel.userName)!")
                            .appFont(.titleLSemibold)
                            .foregroundStyle(.whiteHigh)
                        
                        //MARK: -Kurslar
                        VStack(alignment: .leading, spacing: 16) {
                            Text("Kurslar")
                                .appFont(.titleSmBold)
                                .foregroundStyle(.whiteHigh)
                            
                            CourseGridView()
                        }
                        
                        //MARK: -Muellimler
                        VStack(alignment: .leading, spacing: 16) {
                            Text("Muellimler")
                                .appFont(.titleSmBold)
                                .foregroundStyle(.whiteHigh)
                            TeacherGridView()
                        }
                    }
                    
                }
                .padding()
                
            }
        }
        .task {
            await viewModel.fetchUserData()
        }
    }
    
}

#Preview {
    MainPageView()
}
