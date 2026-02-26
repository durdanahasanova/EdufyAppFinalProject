//
//  Program.swift
//  EdufyApp
//
//  Created by Durdana on 23.02.26.
//

import Foundation


struct ProgramDetail: Identifiable, Decodable {
    let id: String
    let name: String
    let description: String
    let duration: String
    let groupSize: String
    let logoName: String
    let modules: [ProgramModule]
    let instructor: Instructor?
    
    enum CodingKeys: String, CodingKey {
        case id, name, description, duration, logoName, modules, instructor
        case groupSize = "group_size"
    }
}
