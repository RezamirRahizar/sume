//
//  Date+Extensions.swift
//  sume
//
//  Created by Rezamir Rahizar on 05/12/2025.
//

import SwiftUI

//Non-null `Date` handling
extension Date {
    func getDateString() -> String {
        return self.formatted(.dateTime.month().year())
    }
}

//Nullable `Date` handling
extension Optional where Wrapped == Date {
  func getDateString() -> String {
        if let self {
            return self.getDateString()
        } else {
            return "Present"
        }
    }
}
