//
//  ContentView.swift
//  ComponentsDemoApp
//
//  Created by Liz Isasi on 22/11/2025.
//

import SwiftUI
import SwiftUIComponentsKit

struct ContentView: View {
    var body: some View {
        SwiftUIComponentsKit.PrimaryButton(title: "Presioná acá", action: {
            
            print("Presionaste el botón")
        })
        
        
    }
    
    
    
    
}
    
    #Preview {
        ContentView()
    }

