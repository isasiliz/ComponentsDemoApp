//
//  DetailView.swift
//  ComponentsDemoApp
//
//  Created by Liz Isasi on 28/03/2026.
//

import SwiftUI
import SwiftUIComponentsKit

public struct ButtonComponentView: View {
    public var body: some View {
        VStack {
            Text("Button Component")
                .font(.headline)
            
            PrimaryButton(title: "Primary", variant: .primary) {
                
            }
            PrimaryButton(title: "Secondary", variant: .secondary) {
                
            }

            PrimaryButton(title: "Danger", variant: .danger) {
                
            }
            PrimaryButton(title: "Neutral", variant: .neutral) {
                
            }
            
            
            Rectangle()
                .fill(Color.white.opacity(0.5))
                .frame(height: 1)
                .padding(.vertical)
            
            PrimaryButton(title: "Loading Button", variant: .primary, isLoading: true) {
                
            }

            Spacer()
    
        }
        .padding()
        .background(Color.black)
    }
}

#Preview {
    ButtonComponentView()
}
