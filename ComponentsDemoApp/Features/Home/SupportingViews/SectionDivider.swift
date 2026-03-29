//
//  SectionDivider.swift
//  ComponentsDemoApp
//
//  Created by Liz Isasi on 29/03/2026.
//

import SwiftUI

struct SectionDivider: View {
    var body: some View {
        Rectangle()
            .fill(Color.black.opacity(0.35))
            .frame(height: 1)
            .padding(.vertical, 4)
    }
}
