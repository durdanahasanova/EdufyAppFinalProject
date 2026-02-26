//
//  ApplicationRequest.swift
//  EdufyApp
//
//  Created by Durdana on 25.02.26.
//

import Foundation

struct ApplicationRequest: Encodable {
    let programId: String
    let firstName: String
    let lastName: String
    let phone: String
    
    enum CodingKeys: String, CodingKey {
            case programId = "program_id"
            case firstName = "first_name"
            case lastName = "last_name"
            case phone
        }
}

struct ApplicationResponse: Decodable {
    let success: Bool
    let message: String?
}
