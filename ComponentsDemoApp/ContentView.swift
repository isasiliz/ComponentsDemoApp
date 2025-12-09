//
//  ContentView.swift
//  ComponentsDemoApp
//
//  Created by Liz Isasi on 22/11/2025.
//

import SwiftUI
import SwiftUIComponentsKit

struct ContentView: View {
    
    let onLogin: () -> Void
    let onCreateAccount: () -> Void
    
    var body: some View {
        ZStack {
            LinearGradient.gelatoBackground
                .ignoresSafeArea()
            
            VStack {
                Text("Welcome to Gelato App!")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(40)
                
                VStack(spacing: 24) {
                    
                    PrimaryButton(title: "Ingresar", variant: .primary) {
                        onLogin()
                    }
                    
                    PrimaryButton(title: "Crear cuenta", variant: .secondary) {
                        onCreateAccount()
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    ContentView(onLogin: {}, onCreateAccount: {})
}
