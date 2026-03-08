//
//  VideoCardData.swift
//  EdufyApp
//
//  Created by Durdana on 07.03.26.
//

import Foundation

protocol VideoCardData {
    var videoId: Int { get }
    var videoTitle: String { get }
    var videoThumbnailUrl: String? { get }
    var videoDuration: Int { get }
    var videoTeacherName: String { get }
}

extension DemoVideo: VideoCardData {
    var videoId: Int { id }
    var videoTitle: String { title }
    var videoThumbnailUrl: String? { thumbnailUrl }
    var videoDuration: Int { duration }
    var videoTeacherName: String { teacherName }
}

extension SavedVideo: VideoCardData {
    var videoTitle: String { lessonName }
    var videoThumbnailUrl: String? { thumbnailUrl }
    var videoDuration: Int { durationMinutes }
    var videoTeacherName: String { instructorFullName ?? "-" }
}

extension FeedVideo: VideoCardData {
    var videoId: Int { id }
    var videoTitle: String { title }
    var videoThumbnailUrl: String? { thumbnailUrl }
    var videoDuration: Int { duration }
    var videoTeacherName: String { instructorName }
}

