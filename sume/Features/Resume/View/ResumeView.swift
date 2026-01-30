//
//  ResumeView.swift
//  sume
//
//  Created by Rezamir Rahizar on 21/01/2026.
//

import SwiftUI

struct ResumeView: View {
    @Binding var details: Resume
    
    let dict: [String: String] = [
        "Name": "Alice",
        "Email": "alice@example.com",
        "Notes": "Line 1\nLine 2 with longer text that should wrap properly in the PDF."
    ]
    
    var body: some View {
        VStack(spacing: 8) {
            ScrollView {
                personalDetails
                    .padding(.bottom, 24)
                
                getSectionTitle("EXPERIENCE")
                ForEach(details.workHistory) {  value in
                    DetailsFieldView(
                        title: value.position,
                        institute: value.companyName,
                        location: value.location,
                        startDate: value.startDate,
                        endDate: value.endDate,
                        detailsList: value.responsibilities
                    )
                    .padding(.bottom, 16)
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                }
                .padding(.bottom, 24)
                
                getSectionTitle("EDUCATION")
                ForEach(details.education) {  value in
                    DetailsFieldView(
                        title: value.getEducationLevelString(),
                        institute: value.institution,
                        location: value.location,
                        startDate: value.startDate,
                        endDate: value.endDate,
                    )
                    .padding(.bottom, 16)
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                }
                .padding(.bottom, 24)
                
                getSectionTitle("SKILLS")
                ForEach($details.skills, id: \.self) {  value in
                    SkillCellView(skills: value)
                        .frame(maxWidth: .infinity, alignment: .topLeading)
                }
                .padding(.bottom, 24)
            }
            
            
            Spacer()
        }
        .padding(20)
        .background(Color.white) // ensure printable background
    }
    
    var personalDetails: some View {
        VStack (alignment: .center) {
            Text(details.personalDetails.getFullName())
                .font(.largeTitle)
        
            HStack (spacing: 8) {
                //TODO: Make email link clickable when parsing
                Text(details.personalDetails.email)
                Divider()
                    .frame(height: 16)
                Text(details.personalDetails.address.getLocationString())
                
                if let nationality = details.personalDetails.nationality {
                    Divider()
                        .frame(height: 16)
                    Text(nationality)
                }
            }
            .padding(.top, -12)
                
        }
    }

    
    func getSectionTitle(_ str: String) -> some View {
        VStack(alignment: .leading) {
            Text(str)
                .font(.headline)
            Divider()
        }
        .padding(.bottom, 8)
        
    }
    
    
}


#Preview {
    ResumePreview()
}


private struct ResumePreview: View {
    @State private var resume: Resume = Mocker.getResume()
    
    var body: some View {
        ResumeView(details: $resume)
    }
}
