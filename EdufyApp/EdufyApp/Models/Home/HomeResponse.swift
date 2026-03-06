//
//  HomeResponse.swift
//  EdufyApp
//
//  Created by Durdana on 04.03.26.
//


import Foundation

struct HomeResponse: Decodable {
    let greetingName: String?  
    let popularAcademies: [Academy]?
    let instructors: [Teacher]?
}

