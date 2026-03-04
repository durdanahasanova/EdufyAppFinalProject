//
//  ApplicationEndpoint.swift
//  EdufyApp
//
//  Created by Durdana on 03.03.26.
//

import Foundation

enum ApplicationEndpoint: Endpoint {
    case apply(ApplicationRequest)
    case myApplications

    var path: String {
        switch self {
        case .apply:
            return "/api/applications"
        case .myApplications:
            return "/api/applications/my"
        }
    }

    var method: HttpMethod {
        switch self {
        case .apply:
            return .post
        case .myApplications:
            return .get
        }
    }

    var headers: [String: String]? {
        var headers = ["Content-Type": "application/json"]
        if let token = TokenManager.shared.accessToken {
            headers["Authorization"] = "Bearer \(token)"
        }
        return headers
    }

    var queryItems: [URLQueryItem]? { nil }

    var httpBody: Encodable? {
        switch self {
        case .apply(let request):
            return request
        case .myApplications:
            return nil
        }
    }
}
