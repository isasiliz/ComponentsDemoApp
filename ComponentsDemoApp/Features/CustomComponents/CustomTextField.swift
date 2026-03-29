//
//  CustomTextField.swift
//  ComponentsDemoApp
//
//  Created by Liz Isasi on 28/03/2026.
//

import SwiftUI

enum CustomTextFieldAction {
    case beginEditing
    case textDidChange(String)
    case commit
    case resignFirstResponder
}

struct CustomTextField: View {
    
    let title: String
    let placeholder: String
    @Binding var text: String
    
    var minLength: Int? = nil
    var minLengthMessage: String? = nil
    var maxLength: Int? = nil
    var maxLengthMessage: String? = nil
    
    var onAction: ((CustomTextFieldAction) -> Void)? = nil
    
    @FocusState private var isFocused: Bool
    @State private var hasEdited = false
    
    private var validationMessage: String? {
        if let minLength, hasEdited, !text.isEmpty, text.count < minLength {
            return minLengthMessage ?? "Ingresá al menos \(minLength) caracteres."
        }
        
        if let maxLength, text.count > maxLength {
            return maxLengthMessage ?? "Ingresá como máximo \(maxLength) caracteres."
        }
        
        return nil
    }
    
    private var borderColor: Color {
        validationMessage == nil ? .gray.opacity(0.4) : .red
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.headline)
            
            TextField(placeholder, text: $text)
                .padding()
                .background(Color.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(borderColor, lineWidth: 1)
                )
                .cornerRadius(8)
                .focused($isFocused)
                .onChange(of: isFocused) { newValue in
                    if newValue {
                        onAction?(.beginEditing)
                    } else {
                        hasEdited = true
                        onAction?(.resignFirstResponder)
                    }
                }
                .onChange(of: text) { newValue in
                    hasEdited = true
                    
                    if let maxLength, newValue.count > maxLength {
                        text = String(newValue.prefix(maxLength))
                    }
                    
                    onAction?(.textDidChange(text))
                }
                .onSubmit {
                    hasEdited = true
                    onAction?(.commit)
                }
            
            if let validationMessage {
                Text(validationMessage)
                    .font(.caption)
                    .foregroundColor(.red)
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 8)
    }
}

#Preview {
    PreviewWrapper()
}

private struct PreviewWrapper: View {
    @State private var text = ""
    
    var body: some View {
        CustomTextField(
            title: "Custom TextField",
            placeholder: "Enter text",
            text: $text,
            minLength: 3,
            minLengthMessage: "Galicia quiere más de tres",
            maxLength: 10,
            maxLengthMessage: "Galicia prefiere texto más corto"
        ) { action in
            print(action)
        }
    }
}
