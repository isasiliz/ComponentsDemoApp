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
                if showSplash {
                    SplashView()
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                withAnimation {
                                    showSplash = false
                                }
                            }
                        }
                } else if isLoggedIn {
                    MainTabView(onLogout: {
                        isLoggedIn = false
                    })
                } else {
                    ContentView(
                        onLogin: { isLoggedIn = true },
                        onCreateAccount: { isLoggedIn = true }
                    )
                }
            }
        }
    }
}
