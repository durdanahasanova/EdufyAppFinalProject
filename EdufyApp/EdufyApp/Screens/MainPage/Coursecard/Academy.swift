//
//  Course.swift
//  EdufyApp
//
//  Created by Durdana on 16.02.26.
//

import Foundation

struct Academy: Identifiable, Decodable {
    let id: Int
    let name: String
    let programCount: Int
    let logoUrl: String
}
