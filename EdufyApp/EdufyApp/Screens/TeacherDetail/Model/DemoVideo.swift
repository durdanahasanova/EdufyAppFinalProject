//
//  DemoVideo.swift
//  EdufyApp
//
//  Created by Durdana on 26.02.26.
//

import Foundation

struct DemoVideo: Identifiable, Decodable {
    let id: String
    let title: String
    let thumbnailUrl: String?
    let videoUrl: String
    let duration: String
    let teacherName: String
    
    enum CodingKeys: String, CodingKey {
        case id, title, duration
        case thumbnailUrl = "thumbnail_url"
        case videoUrl = "video_url"
        case teacherName = "teacher_name"
    }
}
