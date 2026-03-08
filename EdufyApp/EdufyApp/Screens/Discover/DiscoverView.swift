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
    @State private var selectedVideo: FeedVideo?
    @State private var searchTask: Task<Void, Never>?

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
                        
                        //MARK: - Search
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.whiteHigh)

                            TextField(
                                "Kurs və ya müəllim axtar...",
                                text: $viewModel.searchText
                            )
                            .foregroundColor(.whiteHigh)
                            .autocorrectionDisabled()

                            if !viewModel.searchText.isEmpty {
                                Button {
                                    viewModel.searchText = ""
                                } label: {
                                    Image(systemName: "xmark.circle.fill")
                                        .foregroundColor(.whiteHigh)
                                }
                            }
                        }
                        .padding(14)
                        .background(.graySecondary)
                        .cornerRadius(32)

                        if viewModel.isLoading {
                            ProgressView()
                                .tint(.white)
                                .frame(maxWidth: .infinity, minHeight: 200)
                        } else {
                            LazyVGrid(columns: columns, spacing: 16) {
                                ForEach(viewModel.videos) { video in
                                    VideoCardView(
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
                VideoPlayerView(feedVideo: video)
                    .hideTabBar()
                    
            }
        }
        .task {
            await viewModel.fetchVideos()
        }
        
        .onChange(of: viewModel.searchText) { _, newValue in
            searchTask?.cancel()
            searchTask = Task {
                try? await Task.sleep(nanoseconds: 500_000_000)
                guard !Task.isCancelled else { return }
                await viewModel.fetchVideos(search: newValue)
            }
        }
    }
}
