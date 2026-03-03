//
//  ProfileMenuItem.swift
//  EdufyApp
//
//  Created by Durdana on 02.03.26.
//

import SwiftUI

struct ProfileMenuItem: View {
    let icon: String
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: 16) {
                Image(icon)
                    .font(.system(size: 20))
                    .foregroundStyle(.blue)
                    .frame(width: 44, height: 44)
                    .background(.blueBackground)
                    .cornerRadius(16)
                
                Text(title)
                    .appFont(.bodyTextMdRegular)
                    .foregroundStyle(.whiteHigh)
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .foregroundStyle(.gray)
                    .font(.system(size: 14))
            }
            .padding(.vertical, 12)
        }
        Divider().background(Color.gray.opacity(0.3))
    }
}

#Preview {
    ProfileMenuItem(icon: "globe.fill", title: "Dil deyisme") {
        //MainPageView()
    }
}
