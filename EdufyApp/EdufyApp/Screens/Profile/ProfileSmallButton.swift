//
//  ProfileSmallButton.swift
//  EdufyApp
//
//  Created by Durdana on 02.03.26.
//

import SwiftUI

struct ProfileSmallButton: View {
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .appFont(.textLRegular)
                .foregroundStyle(.blackHigh)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 10)
                .background(.secondaryYellow)
                .cornerRadius(8)
        }
    }
}

#Preview {
    ProfileSmallButton(title: "Salam") {
        //MainPageView()
    }
}
