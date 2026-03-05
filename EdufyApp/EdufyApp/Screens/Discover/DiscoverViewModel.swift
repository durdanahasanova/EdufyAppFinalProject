//
//  DiscoverViewModel.swift
//  EdufyApp
//
//  Created by Durdana on 02.03.26.
//

import Foundation
import Combine

@MainActor
final class DiscoverViewModel: ObservableObject {
    
    @Published var videos: [DemoVideo] = []
    @Published var isLoading = false
    
    func fetchVideos() async {
        isLoading = true
        defer { isLoading = false }
        
        // TODO: API hazir olanda endpointi qosacam
        videos = DiscoverMockData.videos
    }
}
    
