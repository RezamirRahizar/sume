//
//  HomeCoordinator.swift
//  sume
//
//  Created by Rezamir Rahizar on 17/11/2025.
//

import Foundation
import SwiftUI

enum HomePage {
    case edit
    case history
}

//TODO: Continue coordinator learning using https://medium.com/@michaelmavris/how-to-use-swiftui-coordinators-1011ca881eef
final class HomeCoordinator: Hashable {
    @Binding var navigationPath: NavigationPath
    
    private var id: UUID
    private var output: Output?
    private var page: HomePage
    
    
    struct Output {
        var goToHomeScreen: () -> Void
    }
    
    init(
        page: HomePage,
        navigationPath: Binding<NavigationPath>,
        output: Output? = nil
    ) {
        id = UUID()
        self.page = page
        self.output = output
        self._navigationPath = navigationPath
    }
    
    @ViewBuilder
    func view() -> some View {
        switch self.page {
        case .edit:
            EditView()
        case .history:
            HistoryView()
        }
    }
    
    //What does this do?
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    //Function?
    static func == (
        lhs: HomeCoordinator,
        rhs: HomeCoordinator
    ) ->  Bool {
        return lhs.id == rhs.id
    }
    
    private func editView() -> some View {
        EditView()
        
    }
}
