//
//  HomeEndpoint.swift
//  EdufyApp
//
//  Created by Durdana on 04.03.26.
//

import Foundation

enum HomeEndpoint: Endpoint {
    
    case home(popularTake: Int, instructorTake: Int)
    
        var baseURL: String {
            "http://64.226.99.9:8080"
        }
    
    var path: String{
        "/api/home"
    }
    
    var method: HttpMethod {
        .get
    }
    
    var headers: [String : String]? {
        var headers = ["Content-Type": "application/json"]
        
        if let token = TokenManager.shared.accessToken {
            headers["Authorization"] = "Bearer \(token)"
        }
        return headers
    }
    
    var queryItems: [URLQueryItem]? {
        switch self {
        case .home(let popularTake, let instructorTake):
            return [
                URLQueryItem(name: "popularTake", value: "\(popularTake)"),
                URLQueryItem(name: "instructorTake", value: "\(instructorTake)")
            ]
        }
    }
    
    var httpBody: (any Encodable)? {
        nil
    }
    
    
}
