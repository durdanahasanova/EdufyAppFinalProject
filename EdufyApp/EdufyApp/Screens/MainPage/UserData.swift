//
//  UserData.swift
//  EdufyApp
//
//  Created by Durdana on 02.03.26.
//

import Foundation

struct UserData: Decodable {
    let userId: String
    let email: String
    //let username: String
    let roles: [String]
    let requiresRoleSelection: Bool
}
