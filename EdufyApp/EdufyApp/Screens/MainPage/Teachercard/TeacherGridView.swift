//
//  TeacherGridView.swift
//  EdufyApp
//
//  Created by Durdana on 16.02.26.
//

import SwiftUI

struct TeacherGridView: View {

    @StateObject private var viewModel = TeacherViewModel()
    @State private var selectedTeacherId: Int?
    @State private var searchTask: Task<Void, Never>?
    var searchText: String = ""

    private let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16),
    ]

    var body: some View {

        VStack(alignment: .leading, spacing: 16) {

            if viewModel.isLoading {
                ProgressView()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.vertical, 16)
            } else {

                LazyVGrid(columns: columns) {
                    ForEach(viewModel.teachers) { teacher in
                        TeacherCard(
                            teacherPhoto: teacher.photoUrl,
                            lessonPrice: teacher.priceAzn,
                            teacherName: teacher.fullName,
                            subject: teacher.specialization,
                            onTapDetails: {
                                selectedTeacherId = teacher.id
                                print("LOG: Clicked on \(teacher.fullName)")
                            }
                        )

                    }
                }
            }

        }
        .navigationDestination(item: $selectedTeacherId) { teacherId in
            TeacherDetailView(
                viewModel: TeacherDetailViewModel(teacherId: teacherId)
            )
            //.hideTabBar()
        }

        .task {
            await viewModel.fetchTeachers()
        }
        
        .onChange(of: searchText) { _, newValue in
                searchTask?.cancel()
                searchTask = Task {
                    try? await Task.sleep(nanoseconds: 500_000_000)
                    guard !Task.isCancelled else { return }
                    await viewModel.fetchTeachers(search: newValue)
                }
            }

    }
}
