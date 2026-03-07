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
        GridItem(.flexible(), spacing: 16),
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
                                    DemoVideoCard(
                                        video: video,
                                        onTap: { selectedVideo = video },
                                        showFavorite: true
                                    )
                                }
                            }
                        }
                    }
                    .padding(.horizontal, 16)
                    .padding(.bottom, 32)
                }
            }
            .navigationDestination(item: $selectedVideo) { video in
                VideoPlayerView(
                    video: video,
                    instructorName: "",
                    instructorId: 1,
                    specialization: ""
                )
            }
        }
        .task {
            await viewModel.fetchVideos()
        }
    }
}
