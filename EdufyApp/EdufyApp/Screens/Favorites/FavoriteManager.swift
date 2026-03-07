//
//  FavoritesManager.swift
//  EdufyApp
//
//  Created by Durdana on 03.03.26.
//

import Combine
import Foundation

@MainActor
final class FavoritesManager: ObservableObject {

    private let networkService: NetworkService = DefaultNetworkService()
    static let shared = FavoritesManager()
    @Published var favoriteIDs: Set<Int> = []
    @Published var favoritesVideo: [SavedVideo] = []
    private let key = "edufy_favorite_videos"

    private init() {
        loadLocalFavorites()
    }

    // MARK: - Toggle
    func toggle(_ videoId: Int) {
        if favoriteIDs.contains(videoId) {
            favoriteIDs.remove(videoId)
            Task { await deleteFromApi(videoId: videoId)}
        } else {
            favoriteIDs.insert(videoId)
            Task { await saveToApi(videoId: videoId) }
        }
        
    }

    // MARK: - Yoxla
    func isFavorite(_ videoId: Int) -> Bool {
        favoriteIDs.contains(videoId)
    }

    // MARK: - UserDefaults
    //    private func saveFavorites() {
    //        let array = Array(favoriteIDs)
    //        UserDefaults.standard.set(array, forKey: key)
    //    }

    private func saveToApi(videoId: Int) async {
        do {
            let response: APIResponse<String?> =
                try await networkService.request(
                    SaveVideoEndpoint.save(lessonId: videoId)
                )
            print("LOG: Video api-da saxlanildi \(videoId)")
        } catch {
            favoriteIDs.remove(videoId)
            print("LOG: Video save olunanda xeta oldu \(error)")
        }
    }

    // MARK: - API- favori sil
    private func deleteFromApi(videoId: Int) async {
        do {
            let response: APIResponse<String?> =
                try await networkService.request(
                    SaveVideoEndpoint.delete(lessonId: videoId)
                )
            print("LOG: Video api-dan silindi \(videoId)")
        } catch {
            favoriteIDs.insert(videoId)
            print("LOG: Video silinirken xeta oldu \(error)")
        }
    }

     func fetchFavorites() async {
        do {
            let response: APIResponse<[SavedVideo]> =
                try await networkService.request(SaveVideoEndpoint.getMy)

            if response.success, let data = response.data {
                favoritesVideo = data
                favoriteIDs = Set(data.map { $0.videoId })
                print("LOG: Videolar api-den geldi \(data.count)")
            }
        } catch {
            print(
                "LOG: Favorilər API xətası - \(error), lokal data istifadə olunur"
            )
            loadLocalFavorites()

        }
    }

    private func loadLocalFavorites() {
        if let savedArray = UserDefaults.standard.array(forKey: key) as? [Int] {
            favoriteIDs = Set(savedArray)
        }
    }

    // MARK: - Logout zamani temizle
    func clearAll() {
        favoriteIDs.removeAll()
        favoritesVideo.removeAll()
        UserDefaults.standard.removeObject(forKey: key)
    }
}
