//
//  CollapsibleFormSectionView.swift
//  sume
//
//  Created by Rezamir Rahizar on 08/12/2025.
//

import SwiftUI

struct CollapsibleFormSectionView<Content: View>: View {
    let sectionTitle: String
    @Binding var isExpanded: Bool
    var hasPaddedHeader: Bool = false
    let content: () -> Content
    
    var body: some View {
        Section {
            if isExpanded {
                content()
                    .transition(.opacity.combined(with: .move(edge: .top)))
//                    .padding(.top, hasPaddedHeader ? 16 : 0)
            }
        } header: {
            HStack {
                Text(sectionTitle)
                Spacer()
                Button {
                    withAnimation(.easeInOut(duration: 0.25)) {
                        isExpanded.toggle()
                    }
                } label: {
                    Image(systemName: "chevron.down")
                        .rotationEffect(.degrees(isExpanded ? 0 : -90))
                        .animation(.easeInOut(duration: 0.25), value: isExpanded)
                }
                .tint(.gray)
            }
            
        }
    }
}

#Preview {
    Form {
        CollapsibleFormSectionPreview()
    }
}


private struct CollapsibleFormSectionPreview: View {
    @State var isExpanded: Bool = true
    
    var body: some View {
        CollapsibleFormSectionView(sectionTitle: "Who Are You?", isExpanded: $isExpanded) {
            Text("Hi")
        }
    }
}
