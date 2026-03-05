//
//  DiscoverView.swift
//  EdufyApp
//
//  Created by Durdana on 02.03.26.
//

import SwiftUI

struct DiscoverView: View {
    
    @StateObject private var viewModel = DiscoverViewModel()
    @ObservedObject var favoritesManager = FavoritesManager.shared
    @State private var selectedVideo: DemoVideo?
    
    private let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.background.ignoresSafeArea()
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Kəşfet")
                                .appFont(.titleLSemibold)
                                .foregroundStyle(.whiteHigh)
                            
                            Text("Müəllimlərin demo videoları")
                                .appFont(.bodyTextMdRegular)
                                .foregroundStyle(.whiteMedium)
                        }
                            
                            
                        if viewModel.isLoading {
                            ProgressView()
                                .tint(.white)
                                .frame(maxWidth: .infinity, minHeight: 200)
                        } else {
                            LazyVGrid(columns: columns, spacing: 16) {
                                ForEach(viewModel.videos) { video in
                                    ZStack(alignment: .topTrailing) {
                                        DemoVideoCard(video: video) {
                                            selectedVideo = video
                                        }
                                        
                                        // Favori button
                                        Button {
                                            favoritesManager.toggle(video.id)
                                        } label: {
                                            Image(systemName: favoritesManager.isFavorite(video.id) ? "heart.fill" : "heart")
                                                .font(.system(size: 18))
                                                .foregroundColor(favoritesManager.isFavorite(video.id) ? .white : .white)
//                                                .padding(10)
//                                                .background(.black.opacity(0.5))
//                                                .clipShape(Circle())
                                        }
                                        .padding(12)
                                    }
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
        .task {
            await viewModel.fetchVideos()
        }
    }
}
