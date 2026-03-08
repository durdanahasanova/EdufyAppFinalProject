import Foundation
//
//  CourseGridView.swift
//  EdufyApp
//
//  Created by Durdana on 16.02.26.
//
import SwiftUI

struct CourseGridView: View {

    @StateObject private var viewModel = CourseViewModel()
    @State private var searchTask: Task<Void, Never>?
    var searchText: String = ""

    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 16) {
                ForEach(viewModel.courses) { course in

                    NavigationLink {
                        AcademyDetailView(
                            viewModel: AcademyDetailViewModel(
                                academyId: course.id
                            )
                        )
                        .hideTabBar()
                    } label: {
                        CourseCard(
                            course: course,
                            backgroundColor: .yellowMedium
                        )
                        .frame(width: 320)
                    }
                }
            }
        }
        .task {
            await viewModel.fetchCourses()
        }

        .onChange(of: searchText) { _, newValue in
            searchTask?.cancel()
            searchTask = Task {
                try? await Task.sleep(nanoseconds: 500_000_000)
                guard !Task.isCancelled else { return }
                await viewModel.fetchCourses(search: newValue)
            }
        }
    }
}
