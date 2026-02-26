//
//  Program.swift
//  EdufyApp
//
//  Created by Durdana on 18.02.26.
//

import Foundation

struct Program: Identifiable, Hashable, Decodable {
    let id: String
    let title: String
    let duration: String
    let imageName: String
    let status: ProgramStatus
}

enum ProgramStatus: String, Decodable {
    case active = "Active"
    case inactive = "Inactive"
    
   
    
}
