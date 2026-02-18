//
//  AcademyDetail.swift
//  EdufyApp
//
//  Created by Durdana on 18.02.26.
//

import Foundation

struct AcademyDetail: Identifiable {
    let id: String
    let name: String
    let logoName: String
    let aboutText: String
    let stats: [StatItem]
    //let program: [Program]
    
}

struct StatItem: Identifiable {
    let id = UUID()
    let value: String
    let label: String
}
