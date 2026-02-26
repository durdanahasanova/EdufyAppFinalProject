//
//  Instructor.swift
//  EdufyApp
//
//  Created by Durdana on 23.02.26.
//

import Foundation

struct Instructor: Identifiable, Codable {
    let id: String
    let name: String
    let bio: String
    let imageUrl: String?
    let linkedinUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case id, name, bio
        case imageUrl = "image_url"
        case linkedinUrl = "linkedin_url"
    }
}
