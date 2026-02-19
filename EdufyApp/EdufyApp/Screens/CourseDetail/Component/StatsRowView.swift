//
//  StatRowView.swift
//  EdufyApp
//
//  Created by Durdana on 18.02.26.
//

import SwiftUI

struct StatsRowView: View {
    
    let applicationCount: String
    let studentCount: String
    let graduatePercentage: String
    
    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            StatsItemView(
                value: applicationCount,
                label: "Proqramlara\nmüraciət sayı")
            
            StatsItemView(
                value: studentCount,
                label: "Tələbə sayı"
            )
            
            StatsItemView(
                value: graduatePercentage,
                label: "Məzun olan\ntələbələrin sayı"
            )
            
        }
        
    }
}
