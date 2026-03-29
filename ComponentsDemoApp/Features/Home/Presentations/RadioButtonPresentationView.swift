//
//  RadioButtonPresentationView.swift
//  ComponentsDemoApp
//
//  Created by Liz Isasi on 28/03/2026.
//

import SwiftUI
import SwiftUIComponentsKit

struct RadioButtonPresentationView: View {
    @State private var selectedPresentation = "Cone"
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                Text("Radio Button Demo")
                    .font(.title3)
                    .fontWeight(.semibold)
                
                CustomRadioButton(
                    title: "Choose your presentation",
                    options: ["Cone", "Cup", "1/4 Kg"],
                    selectedOption: $selectedPresentation
                ) { selectedValue in
                    print("Radio selected: \(selectedValue)")
                }
                
                selectedContentView
                
                Spacer(minLength: 20)
            }
            .padding()
        }
        .background(LinearGradient.gelatoBackground.ignoresSafeArea())
        .toolbarBackground(.hidden, for: .navigationBar)
    }
    
    @ViewBuilder
    private var selectedContentView: some View {
        switch selectedPresentation {
        case "Cone":
            GelatoCardView(
                emoji: "🍦",
                title: "Cone",
                description: "Classic option with a crunchy cone and your favorite gelato flavor.",
                backgroundColor: Color.orange.opacity(0.18),
                price: "$6.500"
            )
            
        case "Cup":
            GelatoCardView(
                emoji: "🍨",
                title: "Cup",
                description: "A practical choice for enjoying your gelato comfortably anywhere.",
                backgroundColor: Color.pink.opacity(0.15),
                price: "$8.000"
            )
            
        case "1/4 Kg":
            GelatoCardView(
                emoji: "🍧",
                title: "1/4 Kg",
                description: "Perfect for sharing or taking home with up to two flavors.",
                backgroundColor: Color.blue.opacity(0.15),
                price: "$12.000"
            )
            
        default:
            EmptyView()
        }
    }
}

#Preview {
    RadioButtonPresentationView()
}
