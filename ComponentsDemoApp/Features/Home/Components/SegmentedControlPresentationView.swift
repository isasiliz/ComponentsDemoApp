//
//  SegmentedControlPresentationView.swift
//  ComponentsDemoApp
//
//  Created by Liz Isasi on 28/03/2026.
//

import SwiftUI
import SwiftUIComponentsKit

struct SegmentedControlPresentationView: View {
    @State private var selectedCategory = "Chocolate"
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                Text("Segmented Control Demo")
                    .font(.title3)
                    .fontWeight(.semibold)
                
                CustomSegmentedControl(
                    title: "Choose a flavor category",
                    options: ["Chocolate", "Fruity", "Creamy"],
                    selectedOption: $selectedCategory
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
        switch selectedCategory {
        case "Chocolate":
            GelatoCardView(
                emoji: "🍫",
                title: "Chocolate Selection",
                description: "Rich and intense flavors for chocolate lovers.",
                price: "$5.99",
                backgroundColor: Color.brown.opacity(0.18)
            )
            
        case "Fruity":
            GelatoCardView(
                emoji: "🍓",
                title: "Fruity Selection",
                description: "Fresh and refreshing options with a fruity twist.",
                price: "$4.99",
                backgroundColor: Color.pink.opacity(0.15)
            )
            
        case "Creamy":
            GelatoCardView(
                emoji: "🍨",
                title: "Creamy Selection",
                description: "Smooth and classic flavors with a creamy texture.",
                price: "$5.49",
                backgroundColor: Color.orange.opacity(0.16)
            )
            
        default:
            EmptyView()
        }
    }
}

#Preview {
    SegmentedControlPresentationView()
}
