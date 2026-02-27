//
//  TeacherDetail.swift
//  EdufyApp
//
//  Created by Durdana on 26.02.26.
//

import Foundation

struct TeacherDetail: Identifiable, Decodable {
    let id: String
    let name: String
    let subject: String
    let photoUrl: String?
    let bio: String
    let monthlyPrice: String
    let address: String
    let phone: String?
    let demoVideos: [DemoVideo]
    
    
    enum CodingKeys: String, CodingKey {
        case id, name, subject, bio, address, phone
        case photoUrl = "photo_url"
        case monthlyPrice = "monthly_price"
        case demoVideos = "demo_videos"
    }
}

