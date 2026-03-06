//
//  Program.swift
//  EdufyApp
//
//  Created by Durdana on 23.02.26.
//

import Foundation


struct ProgramDetail: Identifiable, Decodable {
    let id: Int
    let name: String
    let about: String
    let duration: String
    let groupSize: String
    //let logoName: String
    let modules: [ProgramModule]
    let instructor: Instructor?
    
    
}
