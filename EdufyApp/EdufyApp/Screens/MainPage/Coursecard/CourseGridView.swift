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
    }
}
