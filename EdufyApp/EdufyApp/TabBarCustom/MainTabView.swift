//
//  MainTabView.swift
//  EdufyApp
//
//  Created by Durdana on 17.02.26.
//

import SwiftUI

struct MainTabView: View {
    
    @Binding var isLoggedIn: Bool
    
    var body: some View {
        TabView {
            
            MainPageView()
                .tabItem {
                    Image("tab_home")
                    Text("Ana səhifə")
                }
            
            
            
            Text("Kəşfet səhifəsi")
                .tabItem {
                    Image("tab_explore")
                    Text("Kəşfet")
                }
            
            Text("Sevimlilər səhifəsi")
                .tabItem {
                    Image("tab_fav")
                    Text("Sevimlilər")
                }
            
            ProfileView(isLoggedIn: $isLoggedIn)
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
        }
    }
}
