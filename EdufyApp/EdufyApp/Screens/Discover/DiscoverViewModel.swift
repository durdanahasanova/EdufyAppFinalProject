//
//  DiscoverViewModel.swift
//  EdufyApp
//
//  Created by Durdana on 02.03.26.
//

import Combine
import Foundation

@MainActor
final class DiscoverViewModel: ObservableObject {

    @Published var videos: [FeedVideo] = []
    @Published var isLoading = false

    private let networkService: NetworkService = DefaultNetworkService()

    func fetchVideos() async {
        isLoading = true
        defer { isLoading = false }

        do {
            let response: APIResponse<[FeedVideo]> =
                try await networkService.request(FeedEndpoint.getVideos())
            
            if response.success, let data = response.data {
                videos = data
                print("LOG: Videolar API- dan ugurla geldi")
            }
        } catch  {
            print("LOG: Discover videolar API dan gelende xeta oldu: \(error)")
            videos = []
        }
        
        //videos = DiscoverMockData.videos
    }
}
