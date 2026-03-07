//
//  SaveVideoCard.swift
//  EdufyApp
//
//  Created by Durdana on 06.03.26.
//

import SwiftUI

struct SavedVideoCard: View {
    let video: SavedVideo
    var onTap: (() -> Void)? = nil
    @ObservedObject var favoritesManager = FavoritesManager.shared

    var body: some View {
        ZStack(alignment: .topTrailing) {
            ZStack(alignment: .bottomLeading) {

                // Background
                ZStack {
                    Color.gray.opacity(0.3)

                    if let urlString = video.thumbnailUrl,
                        let url = URL(string: urlString)
                    {
                        Color.clear
                            .overlay(
                                AsyncImage(url: url) { phase in
                                    switch phase {
                                    case .success(let image):
                                        image.resizable().scaledToFill()
                                    default:
                                        placeholderView
                                    }
                                }
                            )
                            .clipped()
                    } else {
                        placeholderView
                    }
                }
                .clipShape(RoundedRectangle(cornerRadius: 16))

                // Bottom gradient
                LinearGradient(
                    colors: [.clear, .black.opacity(1.4)],
                    startPoint: .center,
                    endPoint: .bottom
                )
                .clipShape(RoundedRectangle(cornerRadius: 16))

                // Video info
                VStack(alignment: .leading, spacing: 4) {
                    HStack(spacing: 4) {
                        Image(systemName: "play.fill")
                            .font(.system(size: 10))
                            .foregroundColor(.black)
                        Text("\(video.durationMinutes) dəq")
                            .font(.system(size: 11, weight: .semibold))
                            .foregroundColor(.black)
                    }
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(Color.primaryYellow)
                    .cornerRadius(4)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.top, .leading], 16)

                    Spacer()

                    VStack(alignment: .leading, spacing: 2) {
                        if let programName = video.instructorFullName {
                            Text(programName)
                                .font(.system(size: 13, weight: .regular))
                                .foregroundColor(.white.opacity(0.8))
                        }
                        Text(video.lessonName)
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.white)
                    }
                    .padding([.bottom, .leading, .trailing], 16)
                }
            }
            .onTapGesture { onTap?() }

            // Favori button
            Button {
                withAnimation {
                    favoritesManager.toggle(video.videoId)
                }
            } label: {
                Image(systemName: "heart.fill")
                    .font(.system(size: 18))
                    .foregroundColor(.white)
                    .padding(10)
                    .background(.black.opacity(0.5))
                    .clipShape(Circle())
            }
            .buttonStyle(.plain)
            .padding(12)
        }
        .frame(height: 275)
        .frame(maxWidth: .infinity)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(.white, lineWidth: 1)
        )
    }

    private var placeholderView: some View {
        ZStack {
            Color.gray.opacity(0.3)
            Image(systemName: "play.rectangle.fill")
                .font(.system(size: 30))
                .foregroundColor(.gray)
        }
    }
}
