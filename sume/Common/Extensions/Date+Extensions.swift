//
//  Date+Extensions.swift
//  sume
//
//  Created by Rezamir Rahizar on 05/12/2025.
//

import SwiftUI

//Non-null `Date` handling
extension Date {
    func getDateString() -> some View {
        return Text(self, format: .dateTime.month().year())
        //.font(.subheadline)
    }
}

//Nullable `Date` handling
extension Optional where Wrapped == Date {
  func getDateString() -> some View {
        if let self {
            return AnyView(self.getDateString())
        } else {
            return AnyView(Text("Present"))
//                .font(.subheadline)
        }
    }
}
