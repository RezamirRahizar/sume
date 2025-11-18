//
//  HomeView.swift
//  sume
//
//  Created by Rezamir Rahizar on 13/11/2025.
//

import SwiftUI

struct HomeView: View {
    //TODO: Move to ViewModel
    struct Output {
        var goToEdit:() -> Void
        var goToHistory:() -> Void
    }
    
    var output: Output
    
    
    var body: some View {
        return VStack {
            Button(
                action: {
                    self.output.goToEdit()
                },
                label: {
                    Text("Edit page")
                }
            ).padding(.bottom, 16)
            
            
            Button(
                action: {
                    self.output.goToHistory()
                },
                label: {
                    Text("History page")
                }
            )
        }
    }
}

#Preview {
    HomeView(output: .init(goToEdit: {}, goToHistory:{}))
}
