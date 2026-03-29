//
//  CreateAccount.swift
//  ComponentsDemoApp
//
//  Created by Liz Isasi on 03/12/2025.
//

import SwiftUI
import SwiftUIComponentsKit

struct CreateAccount: View {
    @State private var name: String = ""
    @State private var lastName: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    let onCreateAccount: () -> Void
    var body: some View {
        ScrollView {
            VStack {
                Text("Creá tu cuenta")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(40)
                
                VStack (spacing: 24) {
                    TextField("Nombre", text: $name)
                        .textInputAutocapitalization(.words)
                    TextField("Apellido", text: $lastName)
                        .textInputAutocapitalization(.words)
                    TextField("Email", text: $email)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled(true)
                    SecureField("Password", text: $password)
                }
                .textFieldStyle(.roundedBorder)
                PrimaryButton(title: "Crear cuenta", variant: .secondary) {
                    onCreateAccount()
                }
            }
        }
        .padding()
    }
}
#Preview {
    CreateAccount(onCreateAccount: {})
}
