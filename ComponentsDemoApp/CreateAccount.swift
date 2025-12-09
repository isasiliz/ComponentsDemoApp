//
//  CreateAccount.swift
//  ComponentsDemoApp
//
//  Created by Liz Isasi on 03/12/2025.
//

import SwiftUI
import SwiftUIComponentsKit

struct CreateAccount: View {
    let onCreateAccount: () -> Void
    var body: some View {
        Text("Create Account")
    }
}
#Preview {
    CreateAccount(onCreateAccount: {})
}
