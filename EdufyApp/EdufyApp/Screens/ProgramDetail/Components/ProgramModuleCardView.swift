//
//  ModuleCardView.swift
//  EdufyApp
//
//  Created by Durdana on 23.02.26.
//


import SwiftUI

struct ProgramModuleCard: View {
    let module: ProgramModule
    let isExpanded: Bool
    let onTap: () -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            // Header Button
            Button(action: onTap) {
                HStack {
                    Text(module.title)
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(.black)
                    
                    Spacer()
                    
                    Image(systemName: isExpanded ? "chevron.down" : "arrow.up.right")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(.white)
                        .frame(width: 32, height: 32)
                        .background(Color.black)
                        .cornerRadius(16)
                }
                .padding(16)
                .background(Color.white)
                .cornerRadius(12)
            }
            
            // Expanded Content
            if isExpanded {
                VStack(alignment: .leading, spacing: 12) {
                    Text("Lesson 1: \(module.title)")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(.black)
                        .padding(.top, 16)
                    
                    VStack(alignment: .leading, spacing: 6) {
                        ForEach(module.topics, id: \.self) { topic in
                            HStack(alignment: .top, spacing: 8) {
                                Text("•")
                                    .font(.system(size: 14))
                                    .foregroundColor(.black.opacity(0.7))
                                
                                Text(topic)
                                    .font(.system(size: 14, weight: .regular))
                                    .foregroundColor(.black.opacity(0.7))
                            }
                        }
                    }
                }
                .padding(16)
                .padding(.top, -12)
                .background(Color.white)
                .cornerRadius(12)
                .offset(y: -12)
            }
        }
    }
}


