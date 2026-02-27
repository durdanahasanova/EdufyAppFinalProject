//
//  TeacherİnfoRowView.swift
//  EdufyApp
//
//  Created by Durdana on 26.02.26.
//

import SwiftUI

struct TeacherInfoRowView: View {
    
    let icon: String
    let title: String
    let value: String
    
    var body: some View {
        
        HStack(spacing: 16) {
            
            Image(systemName: icon)
                .font(.system(size: 22))
                .foregroundColor(.whiteHigh)
                .frame(width: 44, height: 44)
                .background(.blackHigh)
                .clipShape(Circle())
            
            
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .appFont(.textMdRegular)
                    .foregroundStyle(.blackHigh)
                
                Text(value)
                    .appFont(.bodyTextMdSemibold)
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 12)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.secondaryYellow)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        
    }
}


#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        
        VStack(spacing: 12) {
            TeacherInfoRowView(
                icon: "dollarsign.circle",
                title: "Aylıq dərs qiyməti",
                value: "100 AZN"
            )
            TeacherInfoRowView(
                icon: "mappin.circle",
                title: "Ünvan",
                value: "Bakı"
            )
            TeacherInfoRowView(
                icon: "phone.circle",
                title: "Əlaqə nömrəsi",
                value: "+994 255 00 00"
            )
        }
        .padding(16)
    }
}
