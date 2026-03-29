//
//  TabView.swift
//  ComponentsDemoApp
//
//  Created by Liz Isasi on 01/12/2025.
//

import SwiftUI
import SwiftUIComponentsKit

struct MainTabView: View {
    
    let onLogout: () -> Void
    
    var body: some View {
      TabView {
          HomeView()
              .tabItem {
                  Label("Home", systemImage: "house")
              }
          SettingView(onLogout: onLogout)
              .tabItem {
                  Label("Setting", systemImage: "gear")
              }
        }
      .tint(.gelatoSecondary)
    }
}
#Preview {
    MainTabView(onLogout: {})
}

