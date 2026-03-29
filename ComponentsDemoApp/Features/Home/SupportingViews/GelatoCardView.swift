//
//  GelatoCardView.swift
//  ComponentsDemoApp
//
//  Created by Liz Isasi on 29/03/2026.
//

import SwiftUI

struct GelatoCardView: View {
    let emoji: String
    let title: String
    let description: String
    let backgroundColor: Color
    let price: String?
    
    init(
        emoji: String,
        title: String,
        description: String,
        backgroundColor: Color,
        price: String? = nil
    ) {
        self.emoji = emoji
        self.title = title
        self.description = description
        self.backgroundColor = backgroundColor
        self.price = price
    }
    
    var body: some View {
        VStack(spacing: 16) {
            Text(emoji)
                .font(.system(size: 54))
            
            Text(title)
                .font(.title2)
                .fontWeight(.bold)
            
            Text(description)
                .font(.body)
                .multilineTextAlignment(.center)
                .foregroundColor(.secondary)
            
            if let price {
                Text(price)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .padding(.top, 4)
            }
        }
        .frame(maxWidth: .infinity)
        .padding(24)
        .background(backgroundColor)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(color: .black.opacity(0.06), radius: 8, x: 0, y: 4)
    }
}

#Preview {
    GelatoCardView(
        emoji: "🍦",
        title: "Small Gelato",
        description: "Perfect for a quick sweet break. Ideal for one flavor.",
        backgroundColor: Color.pink.opacity(0.15), 
        price: "$3.99"
    )
    .padding()
}
