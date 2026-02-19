//
//  DetailHeaderView.swift
//  EdufyApp
//
//  Created by Durdana on 17.02.26.
//

import SwiftUI

struct DetailHeaderView: View {
    
    let logoName: String
    let name: String
    
    var body: some View {
        HStack(alignment: .center, spacing: 20) {
            
            RoundedRectangle(cornerRadius: 20)
                .fill(.whiteDisable)
                .frame(width: 72, height: 72)
                .overlay(
                    Image(logoName)
                        .resizable()
                        .scaledToFit()
                )
            
            Text(name)
                .appFont(.titleLExtrabold)
                .foregroundStyle(.whiteHigh)
                .lineLimit(2)
            
            Spacer()
        }
        
    }
    
}

#Preview {
    DetailHeaderView(logoName: "examplephoto.", name: "ABB \nTech Academy")
}
