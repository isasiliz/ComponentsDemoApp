//
//  HomeView.swift
//  ComponentsDemoApp
//
//  Created by Liz Isasi on 01/12/2025.
//

import SwiftUI
import SwiftUIComponentsKit


class Coordinator: ObservableObject {
    @Published var path: [Screen] = []
    
    func push(_ screen: Screen) {
        path.append(screen)
    }
    
    func pop() {
        path.removeLast()
    }
}


enum Screen: Hashable {
    case firstComponent
    case secondComponent
    case thirdComponent
    case fourthComponent
}

public struct HomeView: View {
    @ObservedObject var coordinator = Coordinator()
    
    public var body: some View {
        NavigationStack(path: $coordinator.path) {
            VStack {
                Button("Buttons") {
                    coordinator.push(.firstComponent)
                }
                Button("TextFields") {
                    coordinator.push(.secondComponent)
                }

            }
            .navigationTitle(Text("Home"))
            .navigationDestination(for: Screen.self) { item in
                switch item {
                case .firstComponent:
                    ButtonComponentView()
                case .secondComponent:
                    Text("second component")
                case .thirdComponent:
                    Text("third component")
                case .fourthComponent:
                    Text("fourth component")
                }
            }
        }
    }
}
