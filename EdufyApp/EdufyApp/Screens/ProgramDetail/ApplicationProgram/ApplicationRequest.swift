//
//  ApplicationRequest.swift
//  EdufyApp
//
//  Created by Durdana on 25.02.26.
//

import Foundation

struct ApplicationRequest: Encodable {
    let programId: Int
    let firstName: String
    let lastName: String
    let phoneNumber: String
    
}

struct ApplicationResponse: Decodable {
    let success: Bool
    let message: String?
}
