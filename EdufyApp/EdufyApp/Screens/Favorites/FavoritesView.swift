//
//  FavoritesView.swift
//  EdufyApp
//
//  Created by Durdana on 05.03.26.
//

import SwiftUI

struct FavoritesView: View {
    
    @ObservedObject var favoritesManager = FavoritesManager.shared
    @State private var selectedVideo: DemoVideo?
    
    private let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16),
    ]
    
    private var favoriteVideos: [DemoVideo] {
        DiscoverMockData.videos.filter { video in
            favoritesManager.isFavorite(video.id)
        }
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.background.ignoresSafeArea()
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        
                        Text("Sevimlilər")
                            .appFont(.titleLSemibold)
                            .foregroundStyle(.whiteHigh)
                        
                        if favoriteVideos.isEmpty {
                            VStack(spacing: 16) {
                                Image(systemName: "heart.slash")
                                    .font(.system(size: 32))
                                    .foregroundColor(.whiteMedium)
                                
                                Text("Hələ sevimli videonuz yoxdur")
                                    .appFont(.bodyTextMdRegular)
                                    .foregroundStyle(.whiteMedium)
                                
                                Text(
                                    "Kəşfet bölməsindən videoları sevimlilərə əlavə edin"
                                )
                                .appFont(.textMdRegular)
                                .foregroundStyle(.whiteDisable)
                                .multilineTextAlignment(.center)
                            }
                            .frame(maxWidth: .infinity, minHeight: 300)
                            
                        } else {
                            LazyVGrid(columns: columns, spacing: 16) {
                                ForEach(favoriteVideos) { video in
                                    DemoVideoCard(video: video, onTap: { selectedVideo = video }, showFavorite: true)
                                }
                            }
                        }
                    }
                    .padding(.horizontal, 16)
                    .padding(.bottom, 32)
                }
            }
            .navigationDestination(item: $selectedVideo) { video in
                VideoPlayerView(video: video)
            }
        }
    }
}
