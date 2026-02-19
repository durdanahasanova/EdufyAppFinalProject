//
//  CourseDetailView.swift
//  EdufyApp
//
//  Created by Durdana on 17.02.26.

import SwiftUI

struct CourseDetailView: View {
    var body: some View {
        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 28) {
                DetailHeaderView(logoName: "examplephoto", name: "ABB \nTech Academy")
                
                VStack(alignment: .leading, spacing: 40) {
                    AboutSectionView(text: MockAcademyData.sampleAcademy.aboutText)
                    
                    StatsRowView(applicationCount: "9000+", studentCount: "1600+", graduatePercentage: "68%")
                }
            }
            
        }
    }
}

#Preview {
    CourseDetailView()
}
