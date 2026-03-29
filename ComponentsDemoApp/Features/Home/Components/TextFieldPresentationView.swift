//
//  TextFieldPresentation.swift
//  ComponentsDemoApp
//
//  Created by Liz Isasi on 28/03/2026.
//

import SwiftUI

struct TextFieldPresentationView: View {
    @State private var inputText = ""
    
    var body: some View {
        VStack {
            Text("TextField Presentation View")
            
            Spacer()
            
            CustomTextField(
                title: "Custom TextField",
                placeholder: "Enter text",
                text: $inputText,
                minLength: 3,
                minLengthMessage: nil,
                maxLength: 10,
                maxLengthMessage: "Galicia prefiere texto más corto"
            ) { action in
                switch action {
                case .beginEditing:
                    print("Begin Editing")
                    
                case .textDidChange(let value):
                    print("Text changed: \(value)")
                    
                case .commit:
                    print("Commit")
                    
                case .resignFirstResponder:
                    print("Resign First Responder")
                }
            }
            
            Spacer()
        }
    }
}

#Preview {
    TextFieldPresentationView()
}
