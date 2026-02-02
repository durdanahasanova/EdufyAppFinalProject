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
    case headingMdRegular
    case headingMdMedium
    case bodyTextMdRegular
    
    
    
    var textConfigure: FontStyle {
        switch self {
        case .headerBold:
            return FontStyle(size: 40, weight: .bold, linespacing: 44)
        case .headingMdRegular:
            return FontStyle(size: 17, weight: .regular, linespacing: 24)
        case .headingMdMedium:
            return FontStyle(size: 17, weight: .medium, linespacing: 24)
        case .bodyTextMdRegular:
            return FontStyle(size: 16, weight: .regular, linespacing: 24)
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


