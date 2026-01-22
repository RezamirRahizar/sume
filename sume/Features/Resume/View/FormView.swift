//
//  FormView.swift
//  sume
//
//  Created by Rezamir Rahizar on 18/11/2025.
//

import SwiftUI

struct FormView: View {
    //TODO: Change to Binding
    @State var resumeDetails: Resume
    
    //Collapsible variable
    @Binding var isPersonalToggled: Bool
    @Binding var isWorkToggled: Bool
    @Binding var isEducationToggled: Bool
    @Binding var isSkillsToggled: Bool
    
    @Binding var isExpanded: Bool
    
    var body: some View {
        if (isExpanded) {
            Form {
                CollapsibleFormSectionView(
                    sectionTitle: "Who Are You?",
                    isExpanded: $isPersonalToggled,
                    hasPaddedHeader: true
                ) {
                    PersonalDetailsView(details: $resumeDetails.personalDetails)
                }
                
                CollapsibleFormSectionView(
                    sectionTitle: "Where Did You Work?",
                    isExpanded: $isWorkToggled
                ) {
                    List($resumeDetails.workHistory) {
                        WorkCellView(experience: $0)
                            .padding(8)
                    }
                }
                
                CollapsibleFormSectionView(
                    sectionTitle: "Where Did You Go for School?",
                    isExpanded: $isEducationToggled
                ) {
                    List($resumeDetails.education) {
                        EducationCellView(details: $0)
                    }
                }
                
                CollapsibleFormSectionView(
                    sectionTitle: "What Are You Good At?",
                    isExpanded: $isSkillsToggled
                ) {
                    ForEach($resumeDetails.skills, id: \.self) { skills in
                        SkillCellView(skills: skills)
                    }
                }
            }
            .safeAreaInset(edge: .top) {
                Color.clear.frame(height: 12)
            }
        } else {
            Text("Last Updated: \(resumeDetails.lastUpdated.formatted())")
                .font(.title2)
                .foregroundStyle(.gray)
                
        }
    }
    
    //MARK: Functions
    public func toggleSections(_ value: Bool) {
        isPersonalToggled = value
        isWorkToggled = value
        isEducationToggled = value
        isSkillsToggled = value
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
    
    @State private var isExpanded: Bool = true
    
    
    var body: some View {
        FormView(
            resumeDetails: Resume.getMock(),
            isPersonalToggled: $isPersonalToggled,
            isWorkToggled: $isWorkToggled,
            isEducationToggled: $isEducationToggled,
            isSkillsToggled: $isSkillsToggled,
            isExpanded: $isExpanded
        )
    }
    
    
}
