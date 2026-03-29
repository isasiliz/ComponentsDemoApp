//
//  HomeView.swift
//  ComponentsDemoApp
//
//  Created by Liz Isasi on 01/12/2025.
//

import SwiftUI
import SwiftUIComponentsKit

class Coordinator: ObservableObject {
    @Published var path: [Screen] = []
    
    func push(_ screen: Screen) {
        path.append(screen)
    }
    
    func pop() {
        guard !path.isEmpty else { return }
        path.removeLast()
    }
}

enum Screen: Hashable {
    case buttons
    case textFields
    case segmentedControl
    case radioButton
}

public struct HomeView: View {
    @StateObject private var coordinator = Coordinator()
    
    public init() {}
    
    public var body: some View {
        NavigationStack(path: $coordinator.path) {
            ScrollView {
                VStack(spacing: 24) {
                    headerView
                    
                    VStack(spacing: 16) {
                        componentRow(
                            title: "Buttons",
                            subtitle: "Explore button variants and loading state",
                            emoji: "🔘"
                        ) {
                            coordinator.push(.buttons)
                        }
                        
                        componentRow(
                            title: "TextFields",
                            subtitle: "Reusable input with validation and events",
                            emoji: "⌨️"
                        ) {
                            coordinator.push(.textFields)
                        }
                        
                        componentRow(
                            title: "Segmented Control",
                            subtitle: "Switch between options with a tab-like control",
                            emoji: "🗂️"
                        ) {
                            coordinator.push(.segmentedControl)
                        }
                        
                        componentRow(
                            title: "Radio Button",
                            subtitle: "Select one option from a grouped list",
                            emoji: "🔘"
                        ) {
                            coordinator.push(.radioButton)
                        }
                    }
                    
                    Spacer(minLength: 20)
                }
                .padding()
            }
            .background(LinearGradient.gelatoBackground.ignoresSafeArea())
            .navigationTitle("Home")
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(for: Screen.self) { item in
                switch item {
                case .buttons:
                    ButtonPresentationView()
                case .textFields:
                    TextFieldPresentationView()
                case .segmentedControl:
                    SegmentedControlPresentationView()
                case .radioButton:
                    RadioButtonPresentationView()
                }
            }
        }
    }
    
    private var headerView: some View {
        VStack(spacing: 12) {
            Text("Gelato Components")
                .font(.largeTitle)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
            
            Text("Explore the reusable SwiftUI components included in the demo app.")
                .font(.body)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
        }
        .padding(.top, 8)
    }
    
    private func componentRow(
        title: String,
        subtitle: String,
        emoji: String,
        action: @escaping () -> Void
    ) -> some View {
        Button(action: action) {
            HStack(spacing: 16) {
                Text(emoji)
                    .font(.system(size: 30))
                    .frame(width: 52, height: 52)
                    .background(Color.white.opacity(0.7))
                    .clipShape(RoundedRectangle(cornerRadius: 14))
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(title)
                        .font(.headline)
                        .foregroundColor(.primary)
                    
                    Text(subtitle)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.leading)
                }
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .foregroundColor(.secondary)
                    .font(.system(size: 14, weight: .semibold))
            }
            .padding(18)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color.white.opacity(0.75))
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .shadow(color: .black.opacity(0.05), radius: 8, x: 0, y: 4)
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    HomeView()
}
