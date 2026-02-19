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
    let programs: [Program]
    
    let applicationCount: String
    let studentCount: String
    let graduatePercentage: String
}


