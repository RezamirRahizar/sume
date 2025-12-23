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
}


