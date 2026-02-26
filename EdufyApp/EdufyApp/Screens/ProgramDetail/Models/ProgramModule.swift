//
//  Module.swift
//  EdufyApp
//
//  Created by Durdana on 23.02.26.
//

import Foundation

struct ProgramModule: Identifiable, Decodable {
    let id: String
    let title: String
    let lessons: [Lesson]
}

struct Lesson: Identifiable, Decodable {
    let id: String
    let title: String
    let topics: [String]
}
