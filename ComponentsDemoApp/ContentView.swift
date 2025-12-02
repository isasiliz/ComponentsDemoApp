//
//  ContentView.swift
//  ComponentsDemoApp
//
//  Created by Liz Isasi on 22/11/2025.
//

import SwiftUI
import SwiftUIComponentsKit

struct ContentView: View {
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
                        print("Login tapped")
                    }
                    
                    PrimaryButton(title: "Crear cuenta", variant: .secondary) {
                        print("Create account tapped")
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
