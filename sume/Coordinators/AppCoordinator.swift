//
//  AppCoordinator.swift
//  sume
//
//  Created by Rezamir Rahizar on 17/11/2025.
//

import SwiftUI
import Combine

final class AppCoordinator: ObservableObject {
    @Published var path: NavigationPath
    
    init(path: NavigationPath) {
        self.path = path
    }
    
    @ViewBuilder
    func view() -> some View {
        HomeView(output: .init(goToEdit: {}, goToHistory: {}))
    }
}
