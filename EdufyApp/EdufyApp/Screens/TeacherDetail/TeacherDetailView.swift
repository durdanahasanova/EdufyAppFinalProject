//
//  TeacherDetailView.swift
//  EdufyApp
//
//  Created by Durdana on 27.02.26.
//

import SwiftUI

struct TeacherDetailView: View {
    
    @StateObject var viewModel: TeacherDetailViewModel
    @Environment(\.dismiss) private var dismiss
    
    private let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 24) {
                    
                    //MARK: Back button
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "arrow.left")
                            .foregroundColor(.white)
                            .frame(width: 28, height: 28)
                    }
                    
                    //MARK: Profile Header
                    VStack(alignment: .center, spacing: 24) {
                        if let urlString = viewModel.photoUrl,
                           let url = URL(string: urlString) {
                            AsyncImage(url: url) { phase in
                                switch phase {
                                case .empty:
                                    ZStack {
                                        Circle()
                                            .fill(Color.gray.opacity(0.3))
                                            .frame(width: 120, height: 120)
                                        Image(systemName: "person.fill")
                                            .font(.system(size: 40))
                                            .foregroundColor(.gray)
                                    }
                                case .success(let image):
                                    image
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 140, height: 140)
                                        .clipShape(Circle())
                                case .failure:
                                    ZStack {
                                        Circle()
                                            .fill(Color.gray.opacity(0.3))
                                            .frame(width: 120, height: 120)
                                        Image(systemName: "person.fill")
                                            .font(.system(size: 40))
                                            .foregroundColor(.gray)
                                    }
                                @unknown default:
                                    ZStack {
                                        Circle()
                                            .fill(Color.gray.opacity(0.3))
                                            .frame(width: 120, height: 120)
                                        Image(systemName: "person.fill")
                                            .font(.system(size: 40))
                                            .foregroundColor(.gray)
                                    }
                                }
                            }
                        } else {
                            ZStack {
                                Circle()
                                    .fill(Color.gray.opacity(0.3))
                                    .frame(width: 120, height: 120)
                                Image(systemName: "person.fill")
                                    .font(.system(size: 40))
                                    .foregroundColor(.gray)
                            }
                        }
                        
                        //MARK: Teacher name & subject
                        VStack(alignment: .center, spacing: 8) {
                            Text(viewModel.name)
                                .appFont(.titleSmBold)
                                .foregroundStyle(.whiteHigh)
                            
                            Text(viewModel.teacherDetail?.subject ?? "-")
                                .appFont(.bodyTextMdRegular)
                                .foregroundStyle(.whiteHigh)
                        }
                    }
                    .frame(maxWidth: .infinity)
                    
                    AboutSectionView(text: viewModel.bio)
                    
                    //MARK: Info teacher detail
                    VStack(spacing: 16) {
                        TeacherInfoRowView(icon: "dollarsign.circle",
                                           title: "Aylıq dərs qiyməti",
                                           value: viewModel.monthlyPrice)
                        
                        TeacherInfoRowView(
                            icon: "mappin.circle",
                            title: "Ünvan",
                            value: viewModel.address
                        )
                        
                        TeacherInfoRowView(
                            icon: "phone.circle",
                            title: "Əlaqə nömrəsi",
                            value: viewModel.phone
                        )
                    }
                    
                    //MARK: Demo Video
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Demo videolar")
                            .appFont(.titleSmBold)
                            .foregroundStyle(.whiteHigh)
                        
                        LazyVGrid(columns: columns, spacing: 16) {
                            ForEach(viewModel.demoVideos) { video in
                                DemoVideoCard(video: video) {
                                    print("LOG: Video tapped - \(video.title)")
                                }
                            }
                        }
                    }
                }
                .padding(.horizontal, 16)
                .padding(.bottom, 32)
            }
        }
        .navigationBarBackButtonHidden(true)
        .task {
            await viewModel.fetchTeacherDetail()
        }
    }
}

#Preview {
    NavigationStack {
        TeacherDetailView(
            viewModel: TeacherDetailViewModel(teacherId: "1")
        )
    }
}
