//
//  Teacher.swift
//  EdufyApp
//
//  Created by Durdana on 16.02.26.
//

import Foundation

struct Teacher: Identifiable, Decodable {
    let id: Int
    let photoUrl: String
    let fullName: String
    let specialization: String
    let priceAzn: Int
}
