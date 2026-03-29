//
//  HomeCoordinator.swift
//  ComponentsDemoApp
//
//  Created by Liz Isasi on 29/03/2026.
//

import SwiftUI

final class HomeCoordinator: ObservableObject {
    @Published var path: [HomeScreen] = []
    
    func push(_ screen: HomeScreen) {
        path.append(screen)
    }
    
    func pop() {
        guard !path.isEmpty else { return }
        path.removeLast()
    }
}
