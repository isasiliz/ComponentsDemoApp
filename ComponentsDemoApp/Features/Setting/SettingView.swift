//
//  SettingView.swift
//  ComponentsDemoApp
//
//  Created by Liz Isasi on 01/12/2025.
//

import SwiftUI
import SwiftUIComponentsKit

struct SettingView: View {
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                headerView
                
                infoCard
            }
            .padding()
        }
        .background(LinearGradient.gelatoBackground.ignoresSafeArea())
    }
    
    private var headerView: some View {
        VStack(spacing: 12) {
            Text("Settings")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text("About the demo application")
                .font(.body)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
        }
        .padding(.top, 8)
    }
    
    private var infoCard: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("About this demo")
                .font(.headline)
            
            Text("Gelato App is a demo application built to showcase reusable SwiftUI components created inside SwiftUIComponentsKit.")
                .font(.body)
                .foregroundColor(.secondary)
            
            Text("The project focuses on modularity, visual consistency and component reuse through a simple and functional app experience.")
                .font(.body)
                .foregroundColor(.secondary)
            
            Text("This demo currently presents buttons, text fields, segmented controls and radio buttons through small interactive examples.")
                .font(.body)
                .foregroundColor(.secondary)
            
            Text("Its purpose is to demonstrate how a Swift Package can help centralize UI elements and improve maintainability across a SwiftUI project.")
                .font(.body)
                .foregroundColor(.secondary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(20)
        .background(Color.white.opacity(0.75))
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(color: .black.opacity(0.05), radius: 8, x: 0, y: 4)
    }
}

#Preview {
    SettingView()
}
