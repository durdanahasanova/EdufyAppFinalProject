//
//  StatsRowView.swift
//  EdufyApp
//
//  Created by Durdana on 17.02.26.
//

import SwiftUI

struct StatsItemView: View {
    
    let value: String
    let label: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(value)
                .appFont(.titleLMedium)
                .foregroundStyle(.whiteHigh)
            
            Text(label)
                .appFont(.textLRegular)
                .foregroundStyle(.whiteMedium)
        }
    }
}
