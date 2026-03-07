//
//  TeacherDetail.swift
//  EdufyApp
//
//  Created by Durdana on 26.02.26.
//

import Foundation

struct TeacherDetail: Identifiable, Decodable {
    let id: Int
    let fullName: String
    let specialization: String
    let photoUrl: String?
    let bio: String
    let priceAzn: String
    let address: String
    let phoneNumber: String?
    let demoVideos: [DemoVideo]
    
    
  
}

