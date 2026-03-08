//
//  AcademyEndpoint.swift
//  EdufyApp
//
//  Created by Durdana on 03.03.26.
//

import Foundation

enum AcademyEndpoint: Endpoint {
    case detail(id: Int)

    var path: String {
        switch self {
        case .detail(let id):
            return "/api/academies/\(id)"
        }
    }

    var method: HttpMethod { .get }

    var headers: [String: String]? {
        var headers = ["Content-Type": "application/json"]
        if let token = TokenManager.shared.accessToken {
            headers["Authorization"] = "Bearer \(token)"
        }
        return headers
    }

    var queryItems: [URLQueryItem]? { nil }

    var httpBody: Encodable? { nil }
}
