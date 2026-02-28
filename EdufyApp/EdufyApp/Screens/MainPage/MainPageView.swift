

import SwiftUI

struct MainPageView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color.black
                    .ignoresSafeArea()
                
                ScrollView{
                    
                    VStack(alignment: .leading, spacing: 28) {
                        
                        Text("Salam \nDurdana Hasan!")
                            .appFont(.titleLSemibold)
                            .foregroundStyle(.whiteHigh)
                        
                        VStack(alignment: .leading, spacing: 16) {
                            Text("Kurslar")
                                .appFont(.titleSmBold)
                                .foregroundStyle(.whiteHigh)
                            
                            CourseGridView()
                        }
                        
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
    }
    
}

#Preview {
    MainPageView()
}
