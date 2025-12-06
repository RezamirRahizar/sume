//
//  Education.swift
//  sume
//
//  Created by Rezamir Rahizar on 13/11/2025.
//

import Foundation

enum EducationLevel: String, Hashable {
    case secondary = "Secondary"
    case bachelor = "Bachelor's Degree"
    case master = "Masters"
    case phd = "Doctorate"
}

@Observable class Education: Identifiable {
    let name: String
    let level: EducationLevel
    let institution: String
    let location: Location
    let startDate: Date
    let endDate: Date
    
    init(name: String, level: EducationLevel, institution: String, location: Location, startDate: Date, endDate: Date) {
        self.name = name
        self.level = level
        self.institution = institution
        self.location = location
        self.startDate = startDate
        self.endDate = endDate
    }
    
    func getEducationLevelString() -> String {
        return level.rawValue + ", " + name
    }
}
