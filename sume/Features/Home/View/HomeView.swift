//
//  HomeView.swift
//  sume
//
//  Created by Rezamir Rahizar on 13/11/2025.
//

import SwiftUI

struct HomeView: View {
    @State private var selectedDetent: PresentationDetent = .fraction(0.2)
    
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
            
        }.sheet(isPresented: .constant(true)) {
            FormView(resumeDetails: getMockDetails())
                .presentationDetents([.fraction(0.2), .large], selection: $selectedDetent)
                .interactiveDismissDisabled()
                .presentationBackgroundInteraction(
                    .enabled(upThrough: .fraction(0.2))
                )

        }
    }
    
    private func getMockDetails() -> Resume {
        let mockPersonal = PersonalDeets(firstName: "Joe", lastName:"Doe", email: "joe@email.com", address: Location(state: "Selangor", country: "Malaysia"), nationality: "Korean")
        
        let mockHistory = [
            WorkExperience(companyName: "Grab", location: Location(state: "Kuala Lumpur", country: "Malaysia"), position: "Associate Quality Engineer", startDate: Date(timeIntervalSinceNow: 167000), endDate: nil, responsibilities: ["Worked on iOS projects", "Delivered results"]),
            WorkExperience(companyName: "Foodpanda", location: Location(state: nil, country: "Malaysia"), position: "Senior Quality Engineer", startDate: Date(timeIntervalSinceNow: 167000), endDate: nil, responsibilities: ["Worked on iOS projects", "Delivered results"]),
        ]
        
        let mockEducation = [
            Education(name: "Computer Science (Software Engineering)", level: .bachelor, institution: "UiTM Tapah", location: Location(state: "Kuala Lumpur", country: "Malaysia"), startDate: Date(timeIntervalSince1970: 167000), endDate: Date.now),
            Education(name: "Computer Science (Software Engineering)", level: .master, institution: "Harvard", location: Location(state: "Kuala Selangor", country: "Malaysia"), startDate: Date(timeIntervalSince1970: 167000), endDate: Date.now),
        ]
        
        let mockSkills = [
            Skills(type: .technical, skills: ["Coding"]),
            Skills(type: .soft, skills: ["Speaking"])
        ]
        
        return Resume(personalDetails: mockPersonal, workHistory: mockHistory, education: mockEducation, skills: mockSkills)
        
    }
}

#Preview {
    HomeView(output: .init(goToEdit: {}, goToHistory:{}))
}
