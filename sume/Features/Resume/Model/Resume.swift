//
//  Resume.swift
//  sume
//
//  Created by Rezamir Rahizar on 13/11/2025.
//

import Foundation
import SwiftUI

@Observable class Resume: Identifiable {
    var personalDetails: PersonalDeets
    var workHistory: [WorkExperience]
    var education: [Education]
    var skills: [Skills]
    var lastUpdated: Date
    
    init(personalDetails: PersonalDeets, workHistory: [WorkExperience], education: [Education], skills: [Skills], lastUpdated: Date) {
        self.personalDetails = personalDetails
        self.workHistory = workHistory
        self.education = education
        self.skills = skills
        self.lastUpdated = lastUpdated
    }
    
    
    static func getMock() -> Resume {
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
        
        return Resume(personalDetails: mockPersonal, workHistory: mockHistory, education: mockEducation, skills: mockSkills, lastUpdated: Date())
    }
}


