//
//  CustomRadioButton.swift
//  ComponentsDemoApp
//
//  Created by Liz Isasi on 28/03/2026.
//

import SwiftUI
import SwiftUIComponentsKit

struct CustomRadioButton: View {
    
    let title: String
    let options: [String]
    @Binding var selectedOption: String
    var selectedColor: Color = .gelatoSecondary
    var onSelectionChanged: ((String) -> Void)? = nil
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .font(.headline)
            
            VStack(spacing: 14) {
                ForEach(options, id: \.self) { option in
                    Button {
                        withAnimation(.easeInOut(duration: 0.2)) {
                            selectedOption = option
                        }
                        onSelectionChanged?(option)
                    } label: {
                        HStack(spacing: 12) {
                            ZStack {
                                Circle()
                                    .stroke(Color.primary, lineWidth: 1.8)
                                    .frame(width: 24, height: 24)
                                
                                if selectedOption == option {
                                    Circle()
                                        .fill(selectedColor)
                                        .frame(width: 12, height: 12)
                                }
                            }
                            
                            Text(option)
                                .font(.body)
                                .foregroundColor(.primary)
                            
                            Spacer()
                        }
                        .frame(maxWidth: .infinity, minHeight: 44, alignment: .leading)
                        .contentShape(Rectangle())
                    }
                    .buttonStyle(.plain)
                }
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 8)
    }
}

#Preview {
    RadioPreviewWrapper()
}

private struct RadioPreviewWrapper: View {
    @State private var selected = "Cone"
    
    var body: some View {
        CustomRadioButton(
            title: "Choose your presentation",
            options: ["Cone", "Cup", "1/4 Kg"],
            selectedOption: $selected
        ) { value in
            print("Selected: \(value)")
        }
        .padding()
    }
}
