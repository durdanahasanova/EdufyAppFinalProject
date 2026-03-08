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
    @StateObject private var tabBarVisibility = TabBarVisibility()
    
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
            .padding(.bottom, tabBarVisibility.isHidden ? 0 : 82)
            .environment(\.tabBarVisibility, tabBarVisibility)
            
            
            if !tabBarVisibility.isHidden {
                CustomTabBar(selectedTab: $selectedTab)
                    
            }
        }
        .ignoresSafeArea(edges: .bottom)
        
    }
}
