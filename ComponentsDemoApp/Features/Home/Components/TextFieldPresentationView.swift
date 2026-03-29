//
//  TextFieldPresentation.swift
//  ComponentsDemoApp
//
//  Created by Liz Isasi on 28/03/2026.
//

import SwiftUI
import SwiftUIComponentsKit


struct TextFieldPresentationView: View {
    @State private var inputText = ""
    @State private var eventMessage = "Start typing to see updates"
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                Text("TextField Demo")
                    .font(.title3)
                    .fontWeight(.semibold)
                
                Text("This example shows a reusable text field with validation and interaction events.")
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                
                VStack(spacing: 20) {
                    CustomTextField(
                        title: "Your nickname",
                        placeholder: "Enter text",
                        text: $inputText,
                        minLength: 3,
                        minLengthMessage: "Please enter at least 3 characters",
                        maxLength: 10,
                        maxLengthMessage: "Please keep it under 10 characters"
                    ) { action in
                        switch action {
                        case .beginEditing:
                            eventMessage = "User started editing"
                            print("Begin Editing")
                            
                        case .textDidChange(let value):
                            eventMessage = "Current value: \(value)"
                            print("Text changed: \(value)")
                            
                        case .commit:
                            eventMessage = "User submitted the text field"
                            print("Commit")
                            
                        case .resignFirstResponder:
                            eventMessage = "User finished editing"
                            print("Resign First Responder")
                        }
                    }
                    
                    VStack(spacing: 12) {
                        Text("Live preview")
                            .font(.headline)
                        
                        Text(inputText.isEmpty ? "No text yet" : inputText)
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(inputText.isEmpty ? .secondary : .primary)
                        
                        Text(eventMessage)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.center)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(24)
                    .background(Color.pink.opacity(0.08))
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .shadow(color: .black.opacity(0.05), radius: 8, x: 0, y: 4)
                }
                
                Spacer(minLength: 20)
            }
            .padding()
        }
        .background(LinearGradient.gelatoBackground.ignoresSafeArea())
    }
}

#Preview {
    TextFieldPresentationView()
}
