//
//  Mocker.swift
//  sume
//
//  Created by Rezamir Rahizar on 28/01/2026.
//

import Foundation

public class Mocker {
    static let personalDetails = PersonalDeets(firstName: "Joe", lastName:"Doe", email: "joe@email.com", address: Location(state: "Selangor", country: "Malaysia"), nationality: "Korean")
    
    static let workHistory = [
        WorkExperience(companyName: "Grab", location: Location(state: "Kuala Lumpur", country: "Malaysia"), position: "Associate Quality Engineer", startDate: Date(timeIntervalSinceNow: 167000), endDate: nil, responsibilities: ["Worked on iOS projects", "Delivered results"]),
        WorkExperience(companyName: "Foodpanda", location: Location(state: nil, country: "Malaysia"), position: "Senior Quality Engineer", startDate: Date(timeIntervalSinceNow: 167000), endDate: nil, responsibilities: ["Worked on iOS projects", "Delivered results"]),
        WorkExperience(companyName: "Setel", location: Location(state: nil, country: "Malaysia"), position: "Senior Quality Engineer Alias Developer Tersohor", startDate: Date(timeIntervalSinceNow: 167000), endDate: nil, responsibilities: ["Worked on iOS projects", "Delivered results"]),
    ]
    
    static let education = [
        Education(name: "Computer Science (Software Engineering)", level: .bachelor, institution: "UiTM Tapah", location: Location(state: "Kuala Lumpur", country: "Malaysia"), startDate: Date(timeIntervalSince1970: 167000), endDate: Date.now),
        Education(name: "Computer Science (Software Engineering)", level: .master, institution: "Harvard", location: Location(state: "Kuala Selangor", country: "Malaysia"), startDate: Date(timeIntervalSince1970: 167000), endDate: Date.now),
    ]
    
    static let skills = [
        Skills(type: .technical, skills: ["Coding"]),
        Skills(type: .soft, skills: ["Speaking"])
    ]
    
    static func getResume() -> Resume {
        return Resume(
            personalDetails: personalDetails,
            workHistory: workHistory,
            education: education,
            skills: skills,
            lastUpdated: Date()
        )
    }
}
