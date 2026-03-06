//
//  DetailHeaderView.swift
//  EdufyApp
//
//  Created by Durdana on 17.02.26.
//

import SwiftUI

struct DetailHeaderView: View {

    let logoName: String
    let name: String

    var body: some View {
        HStack(alignment: .center, spacing: 20) {

            AsyncImage(url: URL(string: logoName)) { phase in
                switch phase {
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFit()

                default:
                    Image(systemName: "building.2.fill")
                        .foregroundColor(.gray)
                }
            }
            .frame(width: 72, height: 72)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))

            Text(name)
                .appFont(.titleLExtrabold)
                .foregroundStyle(.whiteHigh)
                .lineLimit(2)

            Spacer()
        }

    }

}

#Preview {
    DetailHeaderView(logoName: "examplephoto.", name: "ABB \nTech Academy")
}
