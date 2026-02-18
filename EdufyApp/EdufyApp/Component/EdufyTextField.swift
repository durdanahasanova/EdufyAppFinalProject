//
//  InputTextField.swift
//  EdufyApp
//
//  Created by Durdana on 29.01.26.
//

import SwiftUI

struct EdufyTextField: View {
    
    let tittle: String
    let placeholder: String
    @Binding var text: String
    
    var error: String? = nil
    var isSecure: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(tittle)
                .appFont(.headingMdRegular)
                .foregroundStyle(.whiteHigh)
            
            Group {
                if isSecure {
                    SecureField(placeholder, text: $text)
                } else {
                    TextField(placeholder, text: $text)
                }
            }
            .appFont(.bodyTextMdRegular)
            .foregroundStyle(.blackHigh)
            .padding(16)
            .background(.whiteHigh)
            .cornerRadius(24)
            
            .overlay(
                RoundedRectangle(cornerRadius: 24)
                    .stroke(error == nil ? .clear : .red, lineWidth: 1)
            )
            
            if let errorMessage = error {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .appFont(.bodyTextMdRegular)
                    .padding(.leading, 4)
            }
        }
    }
}

#Preview {
    //EdufyTextField()
}
