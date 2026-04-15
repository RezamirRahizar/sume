//
//  HomeView.swift
//  sume
//
//  Created by Rezamir Rahizar on 13/11/2025.
//

import SwiftUI

struct HomeView: View {
    @State private var resume: Resume = Mocker.getResume()
    @State private var selectedDetent: PresentationDetent = .fraction(0.2)
    
    @State private var isPersonalToggled: Bool = false
    @State private var isWorkToggled: Bool = false
    @State private var isEducationToggled: Bool = false
    @State private var isSkillsToggled: Bool = false
    @State private var isExpanded: Bool = false
    
    //TODO: Move to ViewModel
    struct Output {
        var goToEdit:() -> Void
        var goToHistory:() -> Void
    }
    
    var output: Output
    
    
    var body: some View {
        return VStack {
//            ResumeView(details: $resume)
            ExportView()
                .padding(.top, -150)
        }.sheet(isPresented: .constant(true)) {
            FormView(
                resumeDetails: Mocker.getResume(),
                isPersonalToggled: $isPersonalToggled,
                isWorkToggled: $isWorkToggled,
                isEducationToggled: $isEducationToggled,
                isSkillsToggled: $isSkillsToggled,
                isExpanded: $isExpanded
            )
                .presentationDetents([.fraction(0.2), .large], selection: $selectedDetent)
                .interactiveDismissDisabled()
                .presentationBackgroundInteraction(
                    .enabled(upThrough: .fraction(0.2))
                )
                .onChange(of: selectedDetent) { oldValue, newValue in
                    updateFormDisplay(from: newValue)
                }
        }
    }
    
    private func updateFormDisplay(from currentDetent: PresentationDetent) {
        let isShowingLarge = currentDetent == .large
    
        isPersonalToggled = isShowingLarge
        isWorkToggled = isShowingLarge
        isEducationToggled = isShowingLarge
        isSkillsToggled = isShowingLarge
        
        isExpanded = isShowingLarge
    }
    
}

#Preview {
    HomeView(output: .init(goToEdit: {}, goToHistory:{}))
}
