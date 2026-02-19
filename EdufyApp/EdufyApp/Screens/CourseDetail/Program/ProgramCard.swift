//
//  ProgramRowCard.swift
//  EdufyApp
//
//  Created by Durdana on 17.02.26.
//

import SwiftUI

struct ProgramCard: View {
    
    let program: Program
    let onArrowTap: (() -> Void)?
    
    var body: some View {
        HStack {
            
            ZStack(alignment: .bottomLeading) {
                Image(program.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 117, height: 93)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .border(.blackHigh, width: 2)
                
                // Status badge
                Text(program.status.rawValue)
                    .font(.system(size: 10, weight: .medium))
                    .foregroundColor(.blackHigh)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 4)
                    .clipShape(Capsule())
                //.offset(x: 4, y: -4)
            }
            
            // title+ duration
            VStack(alignment: .leading, spacing: 8) {
                Text(program.title)
                    .appFont(.bodyTextMdBold)
                    .foregroundColor(.whiteHigh)
                    .lineLimit(2)
                
                Text("Müddət: \(program.duration)")
                    .appFont(.bodyTextSmRegular)
                    .foregroundColor(.whiteMedium)
                
                Button {
                    onArrowTap?()
                } label: {
                    Image(systemName: "arrow.up.right")
                        .foregroundColor(.black)
                        .frame(width: 40, height: 40)
                        .background(Color.white)
                        .clipShape(Circle())
                }
                
            }
        }
    }
}
