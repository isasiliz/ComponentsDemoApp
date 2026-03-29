//
//  DetailView.swift
//  ComponentsDemoApp
//
//  Created by Liz Isasi on 28/03/2026.
//

import SwiftUI
import SwiftUIComponentsKit

public struct ButtonPresentationView: View {
    @State private var lastTappedButton = "No button tapped yet"
    
    public init() {}
    
    public var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                Text("Button Demo")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                
                Text("Explore the different button variants available in the design system.")
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black.opacity(0.75))
                
                VStack(spacing: 16) {
                    PrimaryButton(title: "Primary", variant: .primary) {
                        lastTappedButton = "Primary button tapped"
                    }
                    
                    PrimaryButton(title: "Secondary", variant: .secondary) {
                        lastTappedButton = "Secondary button tapped"
                    }
                    
                    PrimaryButton(title: "Danger", variant: .danger) {
                        lastTappedButton = "Danger button tapped"
                    }
                    
                    PrimaryButton(title: "Neutral", variant: .neutral) {
                        lastTappedButton = "Neutral button tapped"
                    }
                }
                
                VStack(spacing: 16) {
                    Text("Loading state")
                        .font(.headline)
                        .foregroundColor(.black)
                    
                    PrimaryButton(title: "Loading Button", variant: .primary, isLoading: true) {
                        
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(24)
                .background(Color.white.opacity(0.08))
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
                VStack(spacing: 12) {
                    Text("Interaction feedback")
                        .font(.headline)
                        .foregroundColor(.black)
                    
                    Text(lastTappedButton)
                        .font(.body)
                        .foregroundColor(.black.opacity(0.85))
                        .multilineTextAlignment(.center)
                }
                .frame(maxWidth: .infinity)
                .padding(24)
                .background(Color.white.opacity(0.08))
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Spacer(minLength: 20)
            }
            .padding()
        }
        .background(LinearGradient.gelatoBackground.ignoresSafeArea())
    }
}

#Preview {
    ButtonPresentationView()
}
