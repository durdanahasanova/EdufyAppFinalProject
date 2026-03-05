//
//  FavoritesManager.swift
//  EdufyApp
//
//  Created by Durdana on 03.03.26.
//

import Foundation
import Combine

@MainActor
final class FavoritesManager: ObservableObject {

    static let shared = FavoritesManager()

    @Published var favoriteIDs: Set<String> = []

    private let key = "edufy_favorite_videos"

    private init() {
        loadFavorites()
    }

    // MARK: - Toggle 
    func toggle(_ videoId: String) {
        if favoriteIDs.contains(videoId) {
            favoriteIDs.remove(videoId)
        } else {
            favoriteIDs.insert(videoId)
        }
        saveFavorites()
    }

    // MARK: - Yoxla
    func isFavorite(_ videoId: String) -> Bool {
        favoriteIDs.contains(videoId)
    }

    // MARK: - UserDefaults
    private func saveFavorites() {
        let array = Array(favoriteIDs)
        UserDefaults.standard.set(array, forKey: key)
    }

    private func loadFavorites() {
        let array = UserDefaults.standard.stringArray(forKey: key) ?? []
        favoriteIDs = Set(array)
    }

    // MARK: - Logout zamani temizle
    func clearAll() {
        favoriteIDs.removeAll()
        UserDefaults.standard.removeObject(forKey: key)
    }
}
