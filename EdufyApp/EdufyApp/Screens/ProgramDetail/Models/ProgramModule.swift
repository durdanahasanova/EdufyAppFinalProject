//
//  Module.swift
//  EdufyApp
//
//  Created by Durdana on 23.02.26.
//

import Foundation

struct ProgramModule: Identifiable, Decodable {
    let id: Int
    let name: String
    let lessons: [Lesson]
}

struct Lesson: Identifiable, Decodable {
    let id: Int
    let name: String
    
}
