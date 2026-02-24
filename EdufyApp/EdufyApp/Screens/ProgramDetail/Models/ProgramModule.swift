//
//  Module.swift
//  EdufyApp
//
//  Created by Durdana on 23.02.26.
//

import Foundation

struct ProgramModule: Identifiable, Codable {
    let id: String
    let title: String
    let lessonsTittle: String
    let topics: [String]
    
    enum CodingKeys: String, CodingKey {
        case id, title, lessonsTittle, topics
    }
    
}
