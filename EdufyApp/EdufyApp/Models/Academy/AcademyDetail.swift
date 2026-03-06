//
//  AcademyDetail.swift
//  EdufyApp
//
//  Created by Durdana on 18.02.26.
//

import Foundation

struct AcademyDetail: Identifiable, Decodable {
    let id: Int
    let name: String
    let logoUrl: String
    let about: String
    let programs: [Program]
    
    let totalApplications: Int
    let totalStudents: Int
    let graduationRate: Int
}


