//
//  SettingView.swift
//  ComponentsDemoApp
//
//  Created by Liz Isasi on 01/12/2025.
//

import SwiftUI
import SwiftUIComponentsKit

struct SettingView: View {
    let onLogout: () -> Void
    
    var body: some View {
        VStack(spacing: 24) {
            
            PrimaryButton(title: "Cerrar sesion", variant: .danger) {
                onLogout()
            }
        }
        .padding()
    }
}

#Preview {
    SettingView(onLogout: {})
}
