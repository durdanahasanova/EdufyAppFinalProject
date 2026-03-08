//
//  Instructor.swift
//  EdufyApp
//
//  Created by Durdana on 23.02.26.
//

import Foundation

struct Instructor: Identifiable, Codable {
    let id: Int
    let fullName: String
    let specialization: String
    let bio: String
    let photoUrl: String?
    let linkedInUrl: String?
    
}
