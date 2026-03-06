//
//  VideoPlayerView.swift
//  EdufyApp
//
//  Created by Durdana on 28.02.26.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    
    let video: DemoVideo
    @State private var navigateToTeacher = false
    
    @Environment(\.dismiss) private var dismiss
    @State private var player: AVPlayer?
    
    var body: some View {
        ZStack {
            Color.background.ignoresSafeArea()
            
            VStack(spacing: 0) {
                
                // MARK: - Video Player
                ZStack(alignment: .topLeading) {
                    if let player = player {
                        VideoPlayer(player: player)
                            .frame(height: 240)
                    } else {
                        Color.gray.opacity(0.3)
                            .frame(height: 240)
                            .overlay(
                                ProgressView()
                                    .tint(.white)
                            )
                    }
                    
                    // Back button
                    Button {
                        player?.pause()
                        dismiss()
                    } label: {
                        Image(systemName: "arrow.left")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(.blackHigh)
                            .frame(width: 36, height: 36)
                           
                            .clipShape(Circle())
                    }
                    //.padding(.leading, 16)
                    .padding(.top, 8)
                }
                
                // MARK: - Video Info
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 20) {
                        
                        // Title & Duration
                        VStack(alignment: .leading, spacing: 8) {
                            Text(video.title)
                                .appFont(.titleSmBold)
                                .foregroundStyle(.whiteHigh)
                            
                            HStack(spacing: 4) {
                                Image(systemName: "clock")
                                    .font(.system(size: 14))
                                Text(video.duration)
                                    .font(.system(size: 15))
                            }
                            .foregroundColor(.whiteMedium)
                        }
                        .padding(.top, 16)
                        
                        Divider()
                            .background(.white.opacity(0.2))
                        
                        // Teacher Info
                        Button {
                            player?.pause()
                            navigateToTeacher = true
                        } label: {
                            HStack(spacing: 12) {
                                Image(systemName: "person.circle.fill")
                                    .font(.system(size: 40))
                                    .foregroundColor(.gray)
                                
                                VStack(alignment: .leading, spacing: 2) {
                                    Text(video.teacherName)
                                        .appFont(.bodyTextMdSemibold)
                                        .foregroundStyle(.whiteHigh)
                                    
                                    Text("Müəllim")
                                        .appFont(.textMdRegular)
                                        .foregroundStyle(.white.opacity(0.5))
                                }
                                
                                Spacer()
                            }
                        }
                        .navigationDestination(isPresented: $navigateToTeacher) {
                            if let teacherId = video.teacherId {
                               TeacherDetailView(viewModel: TeacherDetailViewModel(teacherId: teacherId))
                            }
                        }
                        
                        
                        
                        Divider()
                            .background(.white.opacity(0.2))
                    }
                    .padding(.horizontal, 16)
                    .padding(.bottom, 32)
                }
                
                Spacer()
            }
        }
        .navigationBarBackButtonHidden(true)
        .onAppear {
            setupPlayer()
        }
        .onDisappear {
            player?.pause()
            player = nil
        }
    }
    
    private func setupPlayer() {
        guard let url = URL(string: video.videoUrl) else { return }
        player = AVPlayer(url: url)
        player?.play()
    }
}

#Preview {
    NavigationStack {
        VideoPlayerView(
            video: DemoVideo(
                id: 1,
                title: "Swift UI Lesson",
                thumbnailUrl: nil,
                videoUrl: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
                duration: "00:21",
                teacherName: "Durdana Hasan", teacherId: 1
            )
        )
    }
}
