//
//  SegmentedControlPresentationView.swift
//  ComponentsDemoApp
//
//  Created by Liz Isasi on 28/03/2026.
//

import SwiftUI
import SwiftUIComponentsKit

struct SegmentedControlPresentationView: View {
    @State private var selectedSize = "Medium"
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                Text("Segmented Control Presentation View")
                    .font(.title3)
                    .fontWeight(.semibold)
                
                CustomSegmentedControl(
                    title: "Choose a size",
                    options: ["Small", "Medium", "Large"],
                    selectedOption: $selectedSize
                ) { selectedValue in
                    print("Segment selected: \(selectedValue)")
                }
                
                selectedContentView
                
                Spacer(minLength: 20)
            }
            .padding()
        }
        .background(LinearGradient.gelatoBackground.ignoresSafeArea())
    }
    
    @ViewBuilder
    private var selectedContentView: some View {
        switch selectedSize {
        case "Small":
            GelatoCardView(
                emoji: "🍦",
                title: "Small Gelato",
                description: "Perfect for a quick sweet break. Ideal for one flavor.",
                price: "$3.99",
                backgroundColor: Color.pink.opacity(0.15)
            )
            
        case "Medium":
            GelatoCardView(
                emoji: "🍨",
                title: "Medium Gelato",
                description: "A balanced choice with more room for creamy happiness.",
                price: "$5.99",
                backgroundColor: Color.orange.opacity(0.18)
            )
            
        case "Large":
            GelatoCardView(
                emoji: "🍧",
                title: "Large Gelato",
                description: "Best option for big cravings and extra toppings.",
                price: "$7.99",
                backgroundColor: Color.blue.opacity(0.15)
            )
            
        default:
            EmptyView()
        }
    }
}

#Preview {
    SegmentedControlPresentationView()
}
