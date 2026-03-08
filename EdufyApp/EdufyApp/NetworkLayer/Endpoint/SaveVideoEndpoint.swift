//
//  SaveVideoEndpoint.swift
//  EdufyApp
//
//  Created by Durdana on 06.03.26.
//

import Foundation

struct SaveVideoRequest: Encodable {
    let lessonId: Int
}

enum SaveVideoEndpoint: Endpoint {

    case getMy
    case save(lessonId: Int)
    case delete(lessonId: Int)

    var path: String {
        switch self {
        case .getMy:
            return "/api/saved-lessons/my"
        case .save:
            return "/api/saved-lessons"
        case .delete(let lessonId):
            return "/api/saved-lessons/\(lessonId)"
        }
    }

    var method: HttpMethod {
        switch self {
        case .getMy: return .get
        case .save: return .post
        case .delete: return .delete
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
        case .save(let lessonId):
            return SaveVideoRequest(lessonId: lessonId)
        default: return nil
        }
    }
}
