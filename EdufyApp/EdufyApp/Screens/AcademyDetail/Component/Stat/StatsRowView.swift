//
//  StatRowView.swift
//  EdufyApp
//
//  Created by Durdana on 18.02.26.
//

import SwiftUI

struct StatsRowView: View {
    
    let applicationCount: Int
    let studentCount: Int
    let graduatePercentage: Int
    
    var body: some View {
        HStack(alignment: .top, spacing: 0) {
            StatsItemView(
                value: "\(applicationCount)+",
                label: "Proqramlara\nmüraciət sayı")
            .frame(maxWidth: .infinity, alignment: .leading)
            
            StatsItemView(
                value: "\(studentCount)",
                label: "Tələbə sayı"
            )
            .frame(maxWidth: .infinity, alignment: .leading)
            
            StatsItemView(
                value: "\(graduatePercentage)%",
                label: "Məzun olan\ntələbələrin sayı"
            )
            .frame(maxWidth: .infinity, alignment: .leading)
            
        }
        
        .frame(maxWidth: .infinity)
        
    }
}
