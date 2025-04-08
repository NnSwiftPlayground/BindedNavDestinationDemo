//
//  MainTabView.swift
//  BindedNavDestinationDemo
//
//  Created by Nikolai Nobadi on 4/7/25.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            Tab("Stale", systemImage: "exclamationmark.triangle") {
                StaleContactNavStack(viewModel: .init())
            }
            
            Tab("Binded", systemImage: "checkmark.seal") {
                BindedContactNavStack(viewModel: .init())
            }
            
            Tab("Apple", systemImage: "apple.logo") {
                AppleContactNavStack(viewModel: .init())
            }
        }
    }
}


// MARK: - Preview
#Preview {
    MainTabView()
}
