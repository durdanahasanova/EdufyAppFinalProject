//
//  CourseGridView.swift
//  EdufyApp
//
//  Created by Durdana on 16.02.26.
//
import SwiftUI
import Foundation

struct CourseGridView: View {
    
    @StateObject private var viewModel = CourseViewModel()
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 16) {
                ForEach(viewModel.courses) { course in
                    
                    CourseCard(course: course, backgroundColor: .primaryOrange)
                    .frame(width: 320)
                }
            }
        }
        .task {
            await viewModel.fetchCourses() }
    }
}
