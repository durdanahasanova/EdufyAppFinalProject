//
//  Button.swift
//  EdufyApp
//
//  Created by Durdana on 29.01.26.
//

import SwiftUI

struct Buttons: View {
    
    enum ButtonStyle {
        case primaryLargeButton
        case disableLargeButton
        case secondaryLargeButton
    }
    
    let title: String
    let style: ButtonStyle
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .appFont(.bodyTextMdRegular)
                .frame(maxWidth: .infinity)
                .padding(16)
                .foregroundStyle(textColor)
                .background(backgroundView)
                .cornerRadius(24)
            
                .overlay(RoundedRectangle(cornerRadius: 24)
                    .stroke(style == .secondaryLargeButton ? .primaryYellow : .clear, lineWidth: 1))
        }
        .padding(20)
        .disabled(style == .disableLargeButton)
    }
    
    @ViewBuilder
        private var backgroundView: some View {
            switch style {
            case .primaryLargeButton:
                Color.yellow
            case .secondaryLargeButton:
                Color.clear
            case .disableLargeButton:
                Color.whiteDisable
            }
        }
    
    private var textColor: Color {
        switch style {
        case .primaryLargeButton:
                .blackHigh
        case .secondaryLargeButton:
                .primaryYellow
        case .disableLargeButton:
                .blackMedium
        }
    }
}

#Preview {
    Buttons(title: "Enter", style: .disableLargeButton, action: {} )
}
