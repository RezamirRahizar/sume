//
//  FormView.swift
//  sume
//
//  Created by Rezamir Rahizar on 18/11/2025.
//

import SwiftUI

struct FormView: View {
    @State var resumeDetails: Resume
    
    //Collapsible variable
    @Binding var isPersonalToggled: Bool
    @Binding var isWorkToggled: Bool
    @Binding var isEducationToggled: Bool
    @Binding var isSkillsToggled: Bool
    
    var body: some View {
        VStack() {
            Form {
                Section(isExpanded: $isPersonalToggled) {
                    PersonalDetailsView(details: $resumeDetails.personalDetails)
                    
                } header: {
                    HStack {
                        Text("Where Did You Work?")
                        Spacer()
                        Button(action: {
                            isPersonalToggled.toggle()
                        }) {
                            Image(systemName:isPersonalToggled ? "chevron.down" : "chevron.right")
                        }
                        .tint(.gray)
                    }
                    .padding(.top, 24)
                }
               
                
                Section(isExpanded: $isWorkToggled) {
                    List($resumeDetails.workHistory) {
                        getWorkFields($0)
                            .padding(8)
                    }
                } header: {
                    HStack {
                        Text("Where Did You Work?")
                        Spacer()
                        Button(action: {
                            isWorkToggled.toggle()
                        }) {
                            Image(systemName:isWorkToggled ? "chevron.down" : "chevron.right")
                        }
                        .tint(.gray)
                    }
                }
                
                Section(isExpanded: $isEducationToggled) {
                    List($resumeDetails.education) {
                        getEducationFields($0)
                    }
                } header: {
                    HStack {
                        Text("Where Did You Go for School?")
                        Spacer()
                        Button(action: {
                            isEducationToggled.toggle()
                        }) {
                            Image(systemName:isEducationToggled ? "chevron.down" : "chevron.right")
                        }
                        .tint(.gray)
                    }
                }
                
                Section(isExpanded: $isSkillsToggled) {
                    ForEach($resumeDetails.skills, id: \.self) { skills in
                        getSkillsFields(skills)
                    }
                } header: {
                    HStack {
                        Text("What Are You Good At?")
                        Spacer()
                        Button(action: {
                            isSkillsToggled.toggle()
                        }) {
                            Image(systemName:isSkillsToggled ? "chevron.down" : "chevron.right")
                        }
                        .tint(.gray)
                    }
                }
                
               

            }
        }
    }
    
    //MARK: Functions
    public func toggleSections(_ value: Bool) {
        isPersonalToggled = value
        isWorkToggled = value
        isEducationToggled = value
        isSkillsToggled = value
    }
    
    //MARK: UI Fields
    private func getWorkFields(_ experience: Binding<WorkExperience>) -> some View {
        WorkCellView(experience: experience)
            
    }
    
    private func getEducationFields(_ experience: Binding<Education>) -> some View {
        EducationCellView(details: experience)
    }
    
    private func getSkillsFields(_ skills: Binding<Skills>) -> some View {
        SkillCellView(skills: skills)
    }
    
}

#Preview {
    FormViewPreview()
}

private struct FormViewPreview: View {
    @State private var isPersonalToggled: Bool = true
    @State private var isWorkToggled: Bool = true
    @State private var isEducationToggled: Bool = true
    @State private var isSkillsToggled: Bool = true
    
    
    var body: some View {
        FormView(resumeDetails: getMockResume(), isPersonalToggled: $isPersonalToggled, isWorkToggled: $isWorkToggled, isEducationToggled: $isEducationToggled, isSkillsToggled: $isSkillsToggled)
    }
    
    private func getMockResume() -> Resume {
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
