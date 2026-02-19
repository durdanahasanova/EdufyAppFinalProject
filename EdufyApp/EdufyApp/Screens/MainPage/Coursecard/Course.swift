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
    let courseCount: Int
    let logoURL: String
}
