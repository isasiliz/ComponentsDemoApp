//
//  TabView.swift
//  ComponentsDemoApp
//
//  Created by Liz Isasi on 01/12/2025.
//

import SwiftUI
import SwiftUIComponentsKit

struct MainTabView: View {
    var body: some View {
      TabView {
          HomeView()
              .tabItem {
                  Label("Home", systemImage: "house")
              }
          SettingView()
              .tabItem {
                  Label("Setting", systemImage: "gear")
              }
        }
      .tint(.gelatoSecondary)
    }
}
