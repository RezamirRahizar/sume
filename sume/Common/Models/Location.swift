//
//  Location.swift
//  sume
//
//  Created by Rezamir Rahizar on 13/11/2025.
//

import Foundation

struct Location: Hashable {
    let state: String?
    let country: String
    
    init(state: String?, country: String) {
        self.state = state
        self.country = country
    }
    
    func getLocationString() -> String {
        if let state = self.state {
            return "\(state), \(country)"
        } else {
            return country
        }
    }
}
