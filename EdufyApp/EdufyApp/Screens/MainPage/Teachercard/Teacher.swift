//
//  Teacher.swift
//  EdufyApp
//
//  Created by Durdana on 16.02.26.
//

import Foundation

struct Teacher: Identifiable, Decodable {
    let id: String
    let teacherPhoto: String
    let teacherName: String
    let subject: String
    let price: Int
}
