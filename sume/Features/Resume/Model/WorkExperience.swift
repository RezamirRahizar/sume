//
//  WorkExperience.swift
//  sume
//
//  Created by Rezamir Rahizar on 13/11/2025.
//

import Foundation

@Observable class WorkExperience: Identifiable {
    var companyName: String
    var location: Location
    var position: String
    var startDate: Date
    var endDate: Date?
    var responsibilities: [String]  //max 5
    
    init(companyName: String, location: Location, position: String, startDate: Date, endDate: Date?, responsibilities: [String]) {
        self.companyName = companyName
        self.location = location
        self.position = position
        self.startDate = startDate
        self.endDate = endDate
        self.responsibilities = responsibilities
    }
}
