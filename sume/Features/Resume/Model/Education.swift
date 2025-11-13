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

struct Education: Hashable {
    let name: String
    let level: EducationLevel
    let institution: String
    let location: String
    let startDate: Date
    let endDate: Date
}
