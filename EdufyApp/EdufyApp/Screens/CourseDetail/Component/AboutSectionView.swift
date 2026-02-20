//
//  AboutCardView.swift
//  EdufyApp
//
//  Created by Durdana on 17.02.26.
//

import SwiftUI
    
    struct AboutSectionView: View {
        let text: String
        
        var body: some View {
            VStack(alignment: .leading, spacing: 12) {
                Text("Haqqında")
                    .appFont(.headingMdSemibold)
                    .foregroundColor(.whiteHigh)
                
                Text(text)
                    .appFont(.bodyTextMdRegular)
                    .foregroundColor(.whiteHigh)
                    
            }
            .padding(16)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(.aboutCardBackground)  
            )
        }
    }


#Preview {
    AboutSectionView(text: MockAcademyData.sampleAcademy.aboutText)
}

