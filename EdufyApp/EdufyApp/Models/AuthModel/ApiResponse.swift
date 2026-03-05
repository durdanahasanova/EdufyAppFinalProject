//
//  APIResponse.swift
//  EdufyApp
//
//  Created by Durdana on 01.03.26.
//

import Foundation

struct APIResponse<T: Decodable>: Decodable {
    let success: Bool
    let statusCode: Int
    let message: String?
    let data: T?
}
