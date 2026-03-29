//
//  CustomSegmentedControl.swift
//  ComponentsDemoApp
//
//  Created by Liz Isasi on 28/03/2026.
//

import SwiftUI
import SwiftUIComponentsKit

struct CustomSegmentedControl: View {
    
    let title: String
    let options: [String]
    @Binding var selectedOption: String
    var onSelectionChanged: ((String) -> Void)? = nil
    
    private let selectedColor = Color.gelatoPrimary
    private let backgroundColor = Color.white.opacity(0.35)
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .font(.headline)
            
            HStack(spacing: 0) {
                ForEach(options, id: \.self) { option in
                    Button {
                        withAnimation(.easeInOut(duration: 0.2)) {
                            selectedOption = option
                        }
                        onSelectionChanged?(option)
                    } label: {
                        Text(option)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(selectedOption == option ? .white : .primary)
                            .frame(maxWidth: .infinity)
                            .frame(minHeight: 52)
                            .contentShape(Rectangle())
                            .background(
                                Group {
                                    if selectedOption == option {
                                        RoundedRectangle(cornerRadius: 12)
                                            .fill(selectedColor)
                                    } else {
                                        Color.clear
                                    }
                                }
                            )
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding(6)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(backgroundColor)
            )
        }
        .padding(.horizontal)
        .padding(.vertical, 8)
    }
}

#Preview {
    SegmentedPreviewWrapper()
}

private struct SegmentedPreviewWrapper: View {
    @State private var selected = "Medium"
    
    var body: some View {
        CustomSegmentedControl(
            title: "Choose a size",
            options: ["Small", "Medium", "Large"],
            selectedOption: $selected
        ) { value in
            print("Selected: \(value)")
        }
        .padding()
    }
}
