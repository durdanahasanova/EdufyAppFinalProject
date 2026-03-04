//
//  Course.swift
//  EdufyApp
//
//  Created by Durdana on 16.02.26.
//

import Foundation

struct Course: Identifiable, Decodable {
    let id: String
    let title: String
    let programCount: Int
    let logoURL: String
}
