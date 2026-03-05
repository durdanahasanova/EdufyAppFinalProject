//
//  DiscoverMockData.swift
//  EdufyApp
//
//  Created by Durdana on 05.03.26.
//

import Foundation

struct DiscoverMockData {
    static let videos: [DemoVideo] = TeacherMockData.all.flatMap { $0.demoVideos }
}


