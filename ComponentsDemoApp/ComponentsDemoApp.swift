//
//  ComponentsDemoApp.swift
//  ComponentsDemoApp
//
//  Created by Liz Isasi on 22/11/2025.
//

import SwiftUI

@main
struct ComponentsDemoApp: App {
    @AppStorage("isLoggedIn") private var isLoggedIn: Bool = false
    @State private var showSplash: Bool = true

    var body: some Scene {
        WindowGroup {
            ZStack {
                MainTabView()
            }
        }
    }
}
