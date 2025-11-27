//
//  PersonalDeets.swift
//  sume
//
//  Created by Rezamir Rahizar on 13/11/2025.
//

import SwiftUI

//struct PersonalDeets: Hashable {
@Observable class PersonalDeets: Identifiable {
    var firstName: String
    var lastName: String?
    var preferredName: String? //will be shown as (Preferred Name)
    var email: String
    var address: Location //denoted as State, Country (exp: Kuala Lumpur, Malaysia)
    var nationality: String? //can adjust based on role applied to, some require nationality info
    
    init(firstName: String, lastName: String? = nil, preferredName: String? = nil, email: String, address: Location, nationality: String? = nil) {
        self.firstName = firstName
        self.lastName = lastName
        self.preferredName = preferredName
        self.email = email
        self.address = address
        self.nationality = nationality
    }
}


