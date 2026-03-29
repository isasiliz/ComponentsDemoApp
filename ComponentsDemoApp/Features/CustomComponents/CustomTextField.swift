//
//  CustomTextField.swift
//  ComponentsDemoApp
//
//  Created by Liz Isasi on 28/03/2026.
//

import SwiftUI
import UIKit

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
    var enforcesMaxLength: Bool = true
    var showsClearButton: Bool = false
    
    var keyboardType: UIKeyboardType = .default
    var textInputAutocapitalization: TextInputAutocapitalization = .sentences
    var autocorrectionDisabled: Bool = false
    
    var titleColor: Color = .primary
    var fieldBackgroundColor: Color = .white
    var normalBorderColor: Color = .gray.opacity(0.4)
    var errorColor: Color = .red
    
    var onAction: ((CustomTextFieldAction) -> Void)? = nil
    
    @FocusState private var isFocused: Bool
    @State private var hasEdited = false
    
    private var validationMessage: String? {
        if let minLength, hasEdited, !text.isEmpty, text.count < minLength {
            return minLengthMessage ?? "Please enter at least \(minLength) characters."
        }
        
        if let maxLength, !enforcesMaxLength, text.count > maxLength {
            return maxLengthMessage ?? "Please enter no more than \(maxLength) characters."
        }
        
        return nil
    }
    
    private var currentBorderColor: Color {
        validationMessage == nil ? normalBorderColor : errorColor
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.headline)
                .foregroundColor(titleColor)
            
            HStack(spacing: 8) {
                TextField(placeholder, text: $text)
                    .keyboardType(keyboardType)
                    .textInputAutocapitalization(textInputAutocapitalization)
                    .autocorrectionDisabled(autocorrectionDisabled)
                    .focused($isFocused)
                    .onChange(of: isFocused) { _, newValue in
                        if newValue {
                            onAction?(.beginEditing)
                        } else {
                            hasEdited = true
                            onAction?(.resignFirstResponder)
                        }
                    }
                    .onChange(of: text) { _, newValue in
                        hasEdited = true
                        
                        if let maxLength, enforcesMaxLength, newValue.count > maxLength {
                            text = String(newValue.prefix(maxLength))
                        }
                        
                        onAction?(.textDidChange(text))
                    }
                    .onSubmit {
                        hasEdited = true
                        onAction?(.commit)
                    }
                
                if showsClearButton, !text.isEmpty {
                    Button {
                        text = ""
                        hasEdited = true
                        onAction?(.textDidChange(text))
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.secondary)
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding()
            .background(fieldBackgroundColor)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(currentBorderColor, lineWidth: 1)
            )
            .cornerRadius(8)
            
            if let validationMessage {
                Text(validationMessage)
                    .font(.caption)
                    .foregroundColor(errorColor)
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
            minLengthMessage: "Galicia wants more than three characters",
            maxLength: 10,
            maxLengthMessage: "Galicia prefers shorter text",
            enforcesMaxLength: true,
            showsClearButton: true,
            keyboardType: .emailAddress,
            textInputAutocapitalization: .never,
            autocorrectionDisabled: true,
            titleColor: .primary
        ) { action in
            print(action)
        }
    }
}
