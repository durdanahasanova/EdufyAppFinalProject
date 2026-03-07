//
//  DemoVideo.swift
//  EdufyApp
//
//  Created by Durdana on 26.02.26.
//

import Foundation

struct DemoVideo: Identifiable, Codable , Hashable{
    let id: Int
    let title: String
    let thumbnailUrl: String?
    let videoUrl: String
    let duration: String
    let teacherName: String
    let teacherId: Int?
   // let isLiked: Bool
    
    enum CodingKeys: String, CodingKey {
        case thumbnailUrl,videoUrl,teacherId //isLiked
        case duration = "durationMinutes"
        case teacherName = "programName"
        case id = "lessonId"
        case title = "lessonName"
        
    }
}
