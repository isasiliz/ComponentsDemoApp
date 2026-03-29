//
//  TextFieldPresentation.swift
//  ComponentsDemoApp
//
//  Created by Liz Isasi on 28/03/2026.
//

import SwiftUI
import SwiftUIComponentsKit

struct TextFieldPresentationView: View {
    @State private var nickname = ""
    @State private var email = ""
    @State private var dni = ""
    @State private var eventMessage = "No interaction yet"
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                Text("TextField Demo")
                    .font(.title3)
                    .fontWeight(.semibold)
                
                Text("This example shows reusable text fields with validation and different keyboard types.")
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                
                VStack(spacing: 20) {
                    CustomTextField(
                        title: "Your nickname",
                        placeholder: "Enter text",
                        text: $nickname,
                        minLength: 3,
                        minLengthMessage: "Please enter at least 3 characters",
                        maxLength: 10,
                        maxLengthMessage: "Please keep it under 10 characters",
                        enforcesMaxLength: true,
                        showsClearButton: true,
                        keyboardType: .default,
                        textInputAutocapitalization: .never,
                        autocorrectionDisabled: true
                    ) { action in
                        switch action {
                        case .beginEditing:
                            eventMessage = "Nickname editing started"
                        case .textDidChange:
                            eventMessage = "Nickname updated"
                        case .commit:
                            eventMessage = "Nickname submitted"
                        case .resignFirstResponder:
                            eventMessage = "Nickname editing ended"
                        }
                    }
                    
                    CustomTextField(
                        title: "Email",
                        placeholder: "Enter your email",
                        text: $email,
                        showsClearButton: true,
                        keyboardType: .emailAddress,
                        textInputAutocapitalization: .never,
                        autocorrectionDisabled: true
                    )
                    
                    CustomTextField(
                        title: "DNI",
                        placeholder: "Enter 8 digits",
                        text: $dni,
                        maxLength: 8,
                        enforcesMaxLength: true,
                        showsClearButton: true,
                        keyboardType: .numberPad,
                        textInputAutocapitalization: .never,
                        autocorrectionDisabled: true
                    )
                }
                
                VStack(spacing: 12) {
                    Text("Last interaction")
                        .font(.headline)
                    
                    Text(eventMessage)
                        .font(.body)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                }
                .frame(maxWidth: .infinity)
                .padding(24)
                .background(Color.white.opacity(0.7))
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Spacer(minLength: 20)
            }
            .padding()
        }
        .background(LinearGradient.gelatoBackground.ignoresSafeArea())
        .toolbarBackground(.hidden, for: .navigationBar)
        .contentShape(Rectangle())
        .onTapGesture {
            hideKeyboard()
        }
    }
    
    private func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

#Preview {
    TextFieldPresentationView()
}
