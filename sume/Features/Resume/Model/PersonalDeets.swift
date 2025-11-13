//
//  PersonalDeets.swift
//  sume
//
//  Created by Rezamir Rahizar on 13/11/2025.
//

struct PersonalDeets: Hashable {
    let firstName: String
    let lastName: String?
    let preferredName: String? //will be shown as (Preferred Name)
    let email: String
    let address: Location //denoted as State, Country (exp: Kuala Lumpur, Malaysia)
    let nationality: String? //can adjust based on role applied to, some require nationality info
}
