//
//  FormView.swift
//  sume
//
//  Created by Rezamir Rahizar on 18/11/2025.
//

import SwiftUI

struct FormView: View {
    @State var resumeDetails: Resume
    
    var body: some View {
        VStack {
            Text("Form View")
            Form {
               personalDetails
                
                Section(header: Text("Where Did You Work?")) {
                    List(resumeDetails.workHistory) {
                        getWorkFields($0)
                    }
                }
                
                Section(header: Text("Where Did You Go for School?")) {
                    List(resumeDetails.workHistory) {
                        getWorkFields($0)
                    }
                }
                
                
            }
        }
    }
    
    var personalDetails: some View {
        //Personal Details
        Section(header: Text("Who Are You?")) {
            //Name
            TextField("First Name", text: $resumeDetails.personalDetails.firstName)
            let lastNameBinding = Binding($resumeDetails.personalDetails.lastName)
            if let lastNameBinding {
                TextField("Last Name", text: lastNameBinding)
            }
            let nickNameBinding = Binding($resumeDetails.personalDetails.preferredName)
            if let nickNameBinding {
                TextField("Preferred Name", text: nickNameBinding)
            }
            
            //Email
            TextField("Email", text: $resumeDetails.personalDetails.email)
            
            //Location
            HStack {
                if let stateBinding = Binding($resumeDetails.personalDetails.address.state) {
                    TextField("State", text: stateBinding)
                    Divider()
                }
                
                TextField("Country", text: $resumeDetails.personalDetails.address.country)
            }
            if let nationalBinding = Binding($resumeDetails.personalDetails.nationality) {
                TextField("Nationality", text: nationalBinding)
            }
        }
    }
    
    private func getWorkFields(_ experience: WorkExperience) -> some View {
        WorkCellView(experience: experience)
            .padding(8)
    }
    
    private func getEducationFields(_ experience: Education) -> some View {
        VStack(alignment: .leading) {
            
        }
    }
    
    private func getDateString(from date: Date?) -> some View {
        if let date {
            return Text(date, format: .dateTime.month().year())
                .font(.subheadline)
        } else {
            return Text("Present")
                .font(.subheadline)
        }
    }
    
    
}

#Preview {
    
    let mockPersonal = PersonalDeets(firstName: "Joe", lastName:"Doe", email: "joe@email.com", address: Location(state: "Selangor", country: "Malaysia"), nationality: "Korean")
    
    let mockHistory = [
        WorkExperience(companyName: "Grab", location: Location(state: "Kuala Lumpur", country: "Malaysia"), position: "Associate Quality Engineer", startDate: Date(timeIntervalSinceNow: 167000), endDate: nil, responsibilities: ["Worked on iOS projects", "Delivered results"]),
        WorkExperience(companyName: "Foodpanda", location: Location(state: nil, country: "Malaysia"), position: "Senior Quality Engineer", startDate: Date(timeIntervalSinceNow: 167000), endDate: nil, responsibilities: ["Worked on iOS projects", "Delivered results"]),
    ]
    
    let mockEducation = [
        Education(name: "Computer Science (Software Engineering)", level: .bachelor, institution: "UiTM Tapah", location: "Tapah", startDate: Date(timeIntervalSince1970: 167000), endDate: Date.now),
        Education(name: "Computer Science (Software Engineering)", level: .master, institution: "Harvard", location: "University of Berkley", startDate: Date(timeIntervalSince1970: 167000), endDate: Date.now),
    ]
    
    let mockSkills = [
        Skills(skills: [
            .technical: [
                "Coding"
            ],
            .soft: [
                "Speaking"
            ]
        ])
    ]
    
    let mockResume = Resume(personalDetails: mockPersonal, workHistory: mockHistory, education: mockEducation, skills: mockSkills)
    
    FormView(resumeDetails: mockResume)
}

