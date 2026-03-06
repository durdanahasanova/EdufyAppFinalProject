//
//  ProgramSectionView.swift
//  EdufyApp
//
//  Created by Durdana on 18.02.26.
//

import SwiftUI

struct ProgramSectionView: View {
    
    let programs: [Program]
    var onProgramTap: ((Program) -> Void)?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text("Programlar")
                .appFont(.titleSmBold)
                .foregroundStyle(.whiteHigh)
            
            LazyVStack(spacing: 16) {
                ForEach(programs) { program in
                    ProgramCard(program: program) {
                        onProgramTap?(program)
                    }
                }
            }
        }
    }
}
