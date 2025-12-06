//
//  EducationCellView.swift
//  sume
//
//  Created by Rezamir Rahizar on 05/12/2025.
//

import SwiftUI

struct EducationCellView: View {
    @State var details: Education
    
    var body: some View {
        Section {
            VStack(alignment: .leading) {
                Text(details.getEducationLevelString())
                    .font(.headline)
                    .lineLimit(3)
                    .padding(.bottom, 2)
                
                HStack {
                    Text(details.institution)
                    Divider()
                    Text(details.location.getLocationString())
                }
                .font(.subheadline)
                HStack(alignment: .top) {
                    details.startDate.getDateString()
                    Text("-")
                    details.endDate.getDateString()
                }
                .font(.subheadline)
                .padding(.bottom, 16)
                
                //TODO: Add area for Degree details?
//                List(details.responsibilities, id: \.self) {
//                    Text("- " + $0)
//                        .font(.body)
//                }
            }
        }
    }
}


#Preview {
    Form {
        EducationCellView(details:
                            Education(
                                name: "Computer Science (Software Engineering)",
                                level: .bachelor,
                                institution: "UiTM Tapah",
                                location: Location(state: "Tapah", country: "Malaysia"),
                                startDate: Date(timeIntervalSince1970: 167000),
                                endDate: Date.now
                            )
        )
    }
}
