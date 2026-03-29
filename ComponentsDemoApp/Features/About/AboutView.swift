//
//  AboutView.swift
//  ComponentsDemoApp
//
//  Created by Liz Isasi on 01/12/2025.
//

import SwiftUI
import SwiftUIComponentsKit

struct AboutView: View {
    
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
            Text("About")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text("Learn more about this demo app")
                .font(.body)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
        }
        .padding(.top, 8)
    }
    
    private var infoCard: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Project overview")
                .font(.headline)
            
            Text("Gelato App is a demo built to showcase reusable SwiftUI components created in SwiftUIComponentsKit.")
                .font(.body)
                .foregroundColor(.secondary)
            
            Text("The project highlights modularity, visual consistency and component reuse through a simple, interactive experience.")
                .font(.body)
                .foregroundColor(.secondary)
            
            Text("It currently includes buttons, text fields, segmented controls and radio buttons presented through small examples.")
                .font(.body)
                .foregroundColor(.secondary)
            
            Text("The goal is to show how a Swift Package can centralize UI components and improve maintainability in a SwiftUI project.")
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
    AboutView()
}
