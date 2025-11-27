//
//  Resume.swift
//  sume
//
//  Created by Rezamir Rahizar on 13/11/2025.
//

import Foundation
import SwiftUI

//TODO: Study Hashable definition at https://developer.apple.com/documentation/Swift/Hashable
//struct Resume: Hashable {
@Observable class Resume: Identifiable {
    var personalDetails: PersonalDeets
    var workHistory: [WorkExperience]
    var education: [Education]
    var skills: [Skills]
    
    init(personalDetails: PersonalDeets, workHistory: [WorkExperience], education: [Education], skills: [Skills]) {
        self.personalDetails = personalDetails
        self.workHistory = workHistory
        self.education = education
        self.skills = skills
    }
}


