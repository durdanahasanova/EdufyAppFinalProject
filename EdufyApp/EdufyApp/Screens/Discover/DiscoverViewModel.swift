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
    @Published var searchText: String = ""

    private let networkService: NetworkService = DefaultNetworkService()

    func fetchVideos(search: String = "") async {
        print("LOG: Discover search = '\(search)'")
        
        isLoading = true
        defer { isLoading = false }

        do {
            let response: APIResponse<[FeedVideo]> =
                try await networkService.request(FeedEndpoint.getVideos( search: search))
            
            if response.success, let data = response.data {
                videos = data
                print("LOG: Videolar API- dan ugurla geldi \(data.count)")
                print("LOG: URL = \(FeedEndpoint.getVideos(search: search).makeRequest())")

            }
        } catch  {
            print("LOG: Discover videolar API dan gelende xeta oldu: \(error)")
            videos = []
        }
        
        //videos = DiscoverMockData.videos
    }
}
