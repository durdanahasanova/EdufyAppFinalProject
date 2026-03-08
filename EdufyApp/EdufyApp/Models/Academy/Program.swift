//
//  Program.swift
//  EdufyApp
//
//  Created by Durdana on 18.02.26.
//

import Foundation

struct Program: Identifiable, Hashable, Decodable {
    let id: Int
    let name: String
    let duration: String
    let instructorPhotoUrl: String
    let status: Int
    
    
    var statusLabel: String {
        switch status {
        case 1:
            return "Aktiv"
        case 0:
            return "Passiv"
        default:
            return "Aktiv"
        }
    }
    
}
