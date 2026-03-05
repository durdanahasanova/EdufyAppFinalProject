//
//  VideoCardView.swift
//  EdufyApp
//
//  Created by Durdana on 26.02.26.
//

import SwiftUI

struct DemoVideoCard: View {
    let video: DemoVideo
    var onTap: (() -> Void)? = nil
    var showFavorite: Bool = false
    @ObservedObject var favoritesManager = FavoritesManager.shared
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            ZStack(alignment: .bottomLeading) {
                
                //  background
                ZStack {
                    Color.gray.opacity(0.3)
                    
                    if let urlString = video.thumbnailUrl,
                       let url = URL(string: urlString) {
                        Color.clear
                            .overlay(
                                AsyncImage(url: url) { phase in
                                    switch phase {
                                    case .success(let image):
                                        image
                                            .resizable()
                                            .scaledToFill()
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
                        Text(video.duration)
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
                        Text(video.teacherName)
                            .font(.system(size: 13, weight: .regular))
                            .foregroundColor(.white.opacity(0.8))
                        
                        Text(video.title)
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.white)
                    }
                    .padding([.bottom, .leading, .trailing], 16)
                }
            }
            .onTapGesture { onTap?() }
            
            // Favori button
            if showFavorite {
                Button {
                    withAnimation {
                        favoritesManager.toggle(video.id)
                    }
                } label: {
                    Image(systemName: favoritesManager.isFavorite(video.id) ? "heart.fill" : "heart")
                        .font(.system(size: 18))
                        .foregroundColor(favoritesManager.isFavorite(video.id) ? .white : .white)
                        .padding(10)
                        .background(.black.opacity(0.5))
                        .clipShape(Circle())
                }
                .buttonStyle(.plain)
                .padding(12)
            }
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
//#Preview {
//    ZStack {
//        Color.black.ignoresSafeArea()
//        let columns = [
//                GridItem(.flexible(), spacing: 16),
//                GridItem(.flexible(), spacing: 16)
//            ]
//
//        LazyVGrid(columns: columns) {
//            DemoVideoCard(
//                video: DemoVideo(
//                    id: "1",
//                    title: "Swift UI Lesson",
//                    thumbnailUrl: "https://images.unsplash.com/photo-1516321318423-f06f85e504b3?w=400",
//                    videoUrl: "https://example.com/video1",
//                    duration: "00:21",
//                    teacherName: "Durdana Hasan", teacherId: "1"
//                ),
//                onTap: {}
//            )
//            DemoVideoCard(
//                video: DemoVideo(
//                    id: "2",
//                    title: "Swift UI Lesson",
//                    thumbnailUrl: nil,
//                    videoUrl: "https://example.com/video2",
//                    duration: "00:21",
//                    teacherName: "Sever Jafarli", teacherId: "2"
//                ),
//                onTap: {}
//            )
//
//            DemoVideoCard(
//                video: DemoVideo(
//                    id: "3",
//                    title: "Swift UI Lesson",
//                    thumbnailUrl: nil,
//                    videoUrl: "https://example.com/video2",
//                    duration: "00:21",
//                    teacherName: "Sever Jafarli", teacherId: "3"
//                ),
//                onTap: {}
//            )
//        }
//        .padding(16)
//    }
//}
