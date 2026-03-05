//
//  HomeResponse.swift
//  EdufyApp
//
//  Created by Durdana on 04.03.26.
//


import Foundation

struct HomeResponse: Decodable {
    let popularAcademies: [Course]?
    let instructors: [Teacher]?
}

//struct HomeAcademy: Identifiable, Decodable {
//    let id: Int
//    let name: String
//    let programCount: Int?
//    let logoUrl: String?
//}
//
//struct HomeInstructor: Identifiable, Decodable {
//    let id: Int
//    let fullName: String
//    let subject: String?
//    let photoUrl: String?
//    let price: Int?
//}
