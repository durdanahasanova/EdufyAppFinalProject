//
//  SaveVideo.swift
//  EdufyApp
//
//  Created by Durdana on 06.03.26.
//

import Foundation

struct SavedVideo: Identifiable, Decodable, Hashable {
    let id: Int
    let videoId: Int
    let lessonName: String
    let thumbnailUrl: String?
    let durationMinutes: Int
    let videoUrl: String
    let programId: Int?
    let programName: String?
    let instructorId: Int?
    let instructorFullName: String?
    let savedAt: String?

    enum CodingKeys: String, CodingKey {
        case id, lessonName, thumbnailUrl, durationMinutes
        case videoId = "lessonId" 
        case videoUrl, programId, programName
        case instructorId, instructorFullName, savedAt
    }
}
