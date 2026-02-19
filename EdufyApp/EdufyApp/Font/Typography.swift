//
//  Typography.swift
//  EdufyApp
//
//  Created by Durdana on 24.01.26.
//

import SwiftUI

enum MontserratWeight: String {
    case bold = "Montserrat-Bold"
    case semibold = "Montserrat-Semibold"
    case medium = "Montserrat-Medium"
    case regular = "Montserrat-Regular"
}

struct FontStyle {
    let size: CGFloat
    let weight: MontserratWeight
    let linespacing: CGFloat
}

enum TextStyle {
    case headerBold
    case titleSmBold
    case titleLMedium
    case titleLSemibold
    case titleLExtrabold
    case headingMdRegular
    case headingMdMedium
    case headingMdSemibold
    case bodyTextMdRegular
    case bodyTextMdBold
    case bodyTextSmRegular
    case textLRegular
    case textMdMedium
    
    
    var textConfigure: FontStyle {
        switch self {
        case .headerBold:
            return FontStyle(size: 40, weight: .bold, linespacing: 44)
            
        case .titleSmBold:
            return FontStyle(size: 20, weight: .bold, linespacing: 28)
            
        case .titleLSemibold:
            return FontStyle(size: 28, weight: .bold, linespacing: 36)
            
        case .titleLMedium:
            return FontStyle(size: 28, weight: .medium, linespacing: 36)
        
        case .titleLExtrabold:
            return FontStyle(size: 24, weight: .bold, linespacing: 32)

            
        case .headingMdRegular:
            return FontStyle(size: 17, weight: .regular, linespacing: 24)
        case .headingMdMedium:
            return FontStyle(size: 17, weight: .medium, linespacing: 24)
        case .headingMdSemibold:
            return FontStyle(size: 17, weight: .semibold, linespacing: 24)
            
        case .bodyTextMdRegular:
            return FontStyle(size: 16, weight: .regular, linespacing: 24)
        case .bodyTextMdBold:
            return FontStyle(size: 16, weight: .bold, linespacing: 24)
        
        case .bodyTextSmRegular:
            return FontStyle(size: 15, weight: .regular, linespacing: 20)
            
        case .textLRegular:
            return FontStyle(size: 14, weight: .regular, linespacing: 18)
            
        case .textMdMedium:
            return FontStyle(size: 13, weight: .medium, linespacing: 18)
        }
    }
}

struct AppTypography: ViewModifier {
    let style: TextStyle
    
    func body(content: Content) -> some View {
        let configuration = style.textConfigure
        return content
            .font(.custom(configuration.weight.rawValue, size: configuration.size))
            //.lineSpacing(configuration.linespacing)
    }
}

extension View {
    func appFont(_ style: TextStyle) -> some View {
        self.modifier(AppTypography(style: style))
    }
}


