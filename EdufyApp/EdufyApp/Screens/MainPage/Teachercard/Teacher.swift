//
//  Teacher.swift
//  EdufyApp
//
//  Created by Durdana on 16.02.26.
//

import Foundation

struct Teacher: Identifiable, Decodable {
    let id: String
    let photoUrl: String
    let fullName: String
    let subject: String
    let price: Int
}
