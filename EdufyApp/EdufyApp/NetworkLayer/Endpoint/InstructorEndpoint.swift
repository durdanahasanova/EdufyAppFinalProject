//
//  InstructorEndpoint.swift
//  EdufyApp
//
//  Created by Durdana on 06.03.26.
//

import Foundation

enum InstructorEndpoint: Endpoint {

    case detail(id: Int, demoTake: Int = 6)

    var path: String {
        switch self {
        case .detail(let id, _):
            return "/api/instructors/\(id)"
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

    var queryItems: [URLQueryItem]? {
        switch self {
        case .detail(_, let demoTake):
            return [URLQueryItem(name: "demoTake", value: "\(demoTake)")]
        }
    }

    var httpBody: Encodable? { nil }
}
