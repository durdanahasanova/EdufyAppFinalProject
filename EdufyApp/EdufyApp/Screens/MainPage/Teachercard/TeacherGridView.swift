//
//  TeacherGridView.swift
//  EdufyApp
//
//  Created by Durdana on 16.02.26.
//

import SwiftUI

struct TeacherGridView: View {
    
  @StateObject private var viewModel = TeacherViewModel()
    
    private let columns = [
            GridItem(.flexible(), spacing: 16),
            GridItem(.flexible(), spacing: 16)
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
                        TeacherCard(teacherPhoto: teacher.teacherPhoto,
                                    lessonPrice: teacher.price,
                                    teacherName: teacher.teacherName,
                                    subject: teacher.subject,
                                    onTapDetails:
                                        { print("LOG: Clicked on \(teacher.teacherName)")}
                                    )
                                    
                        
                    }
                }
            }
        }
        //.padding(.horizontal, 16)
        .task {
            await viewModel.fetchTeachers()
        }
        
    }
}
