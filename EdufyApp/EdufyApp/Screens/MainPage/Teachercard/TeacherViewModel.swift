//
//  TeacherViewModel.swift
//  EdufyApp
//
//  Created by Durdana on 16.02.26.
//

import SwiftUI
import Combine

class TeacherViewModel: ObservableObject {
    
    @Published var teachers: [Teacher] = []
    @Published var isLoading = false
    
    func fetchTeachers() async {
        
        isLoading = true
        
        defer {
            isLoading = false
        }
        
        self.teachers = [
            Teacher(id: "1",
                    teacherPhoto: "https://via.placeholder.com/120",
                    teacherName: "Durdana Hasanova",
                    subject: "IOS Develooper",
                    price: 120),
            
            Teacher(id: "2",
                    teacherPhoto: "https://via.placeholder.com/120",
                    teacherName: "Murad Hasanov",
                    subject: "IOS Develooper",
                    price: 120),
            
            Teacher(id: "3",
                    teacherPhoto: "https://via.placeholder.com/120",
                    teacherName: "Durdana Hasanova",
                    subject: "IOS Develooper",
                    price: 120),
            
            Teacher(id: "4",
                    teacherPhoto: "https://via.placeholder.com/120",
                    teacherName: "Durdana Hasanova",
                    subject: "IOS Develooper",
                    price: 120),
            
            Teacher(id: "5",
                    teacherPhoto: "https://via.placeholder.com/120",
                    teacherName: "Durdana Hasanova",
                    subject: "IOS Develooper",
                    price: 120),
            
            Teacher(id: "6",
                    teacherPhoto: "https://via.placeholder.com/120",
                    teacherName: "Durdana Hasanova",
                    subject: "IOS Develooper",
                    price: 120)
            
        ]
    }
    
    
}
