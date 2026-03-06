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

    @Published var favoriteIDs: Set<Int> = []

    private let key = "edufy_favorite_videos"

    private init() {
        loadFavorites()
    }

    // MARK: - Toggle 
    func toggle(_ videoId: Int) {
        if favoriteIDs.contains(videoId) {
            favoriteIDs.remove(videoId)
        } else {
            favoriteIDs.insert(videoId)
        }
        saveFavorites()
    }

    // MARK: - Yoxla
    func isFavorite(_ videoId: Int) -> Bool {
        favoriteIDs.contains(videoId)
    }

    // MARK: - UserDefaults
    private func saveFavorites() {
        let array = Array(favoriteIDs)
        UserDefaults.standard.set(array, forKey: key)
    }

    private func loadFavorites() {
        if let savedArray = UserDefaults.standard.array(forKey: key) as? [Int] {
            favoriteIDs = Set(savedArray)
        }
    }

    // MARK: - Logout zamani temizle
    func clearAll() {
        favoriteIDs.removeAll()
        UserDefaults.standard.removeObject(forKey: key)
    }
}
