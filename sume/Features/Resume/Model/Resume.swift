//
//  Resume.swift
//  sume
//
//  Created by Rezamir Rahizar on 13/11/2025.
//

import Foundation

struct Resume: Hashable {
    let personalDetails: PersonalDeets
    let workHistory: [WorkExperience]
    let education: [Education]
    let skills: [Skills]
}


