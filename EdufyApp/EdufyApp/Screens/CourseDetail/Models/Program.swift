//
//  Program.swift
//  EdufyApp
//
//  Created by Durdana on 18.02.26.
//

import Foundation

struct Program: Identifiable {
    let id: String
    let title: String
    let duration: String
    let imageName: String
    let status: ProgramStatus
}

enum ProgramStatus: String {
    case active = "Active"
    case inactive = "Inactive"
    
   
    
}
