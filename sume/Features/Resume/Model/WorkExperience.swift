//
//  WorkExperience.swift
//  sume
//
//  Created by Rezamir Rahizar on 13/11/2025.
//

import Foundation

struct WorkExperience: Hashable {
    let companyName: String
    let location: String
    let position: String
    let startDate: Date
    let endDate: Date?
    let responsibilities: [String]  //max 5
}
