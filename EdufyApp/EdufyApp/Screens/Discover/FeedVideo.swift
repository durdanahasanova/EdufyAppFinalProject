//
//  FeedVideo.swift
//  EdufyApp
//
//  Created by Durdana on 07.03.26.
//

import Foundation

struct FeedVideo: Identifiable, Decodable, Hashable {
    let id: Int
    let title: String
    let thumbnailUrl: String?
    let videoUrl: String
    let duration: Int
    let instructorId: Int
    let instructorName: String
    let programId: Int?
    let programName: String?
    let isLiked: Bool
    
    enum CodingKeys: String, CodingKey {
        case thumbnailUrl, videoUrl, instructorId, instructorName
        case programId, programName, isLiked
        case duration = "durationMinutes"
        case id = "lessonId"
        case title = "lessonName"
    }
}
