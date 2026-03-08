//
//  FeedVideoEndpoint.swift
//  EdufyApp
//
//  Created by Durdana on 07.03.26.
//

import Foundation

enum FeedEndpoint: Endpoint {

    case getVideos(search: String = "", page: Int = 1, pageSize: Int = 12)

    var path: String {
        switch self {
        case .getVideos:
            return "/api/feed/videos"
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
        case .getVideos(let search, let page, let pageSize):
            var items = [
                URLQueryItem(name: "Page", value: "\(page)"),
                URLQueryItem(name: "PageSize", value: "\(pageSize)")
            ]
            if !search.isEmpty {
                items.append(URLQueryItem(name: "Search", value: search))
            }
            return items
        }
    }

    var httpBody: Encodable? { nil }
}
