//
//  MainTabView.swift
//  EdufyApp
//
//  Created by Durdana on 17.02.26.
//

import SwiftUI

struct MainTabView: View {
    
    @Binding var isLoggedIn: Bool
    @State private var selectedTab: TabItem = .home
    
    var body: some View {
        
        ZStack(alignment: .bottom) {
            Group {
                switch selectedTab {
                case .home:
                    MainPageView()
                case .explore:
                    DiscoverView()
                case .favorites:
                    FavoritesView()
                case .profile:
                    ProfileView(isLoggedIn: $isLoggedIn)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(.bottom, 82)
            CustomTabBar(selectedTab: $selectedTab)
        }
        .ignoresSafeArea(edges: .bottom)
        
    }
}
