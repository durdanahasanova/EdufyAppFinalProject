//
//  CourseViewModel.swift
//  EdufyApp
//
//  Created by Durdana on 16.02.26.
//

import SwiftUI
import Combine

final class CourseViewModel: ObservableObject {
   @Published var courses: [Course] = []
   @Published var isLoading: Bool = false
    
    func fetchCourses() async {
        isLoading = true
        defer {
            isLoading = false
        }
        
        self.courses = [
            Course(id: "1",
                   title: "Code Academy",
                   courseCount: 8,
                   logoURL: "https://via.placeholder.com/120"),
            
            Course(id: "2",
                   title: "ABB Tech",
                   courseCount: 6,
                   logoURL: "https://via.placeholder.com/120")
        ]
    }
}
