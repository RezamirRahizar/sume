//
//  DetailCellView.swift
//  sume
//
//  Created by Rezamir Rahizar on 27/11/2025.
//

import SwiftUI

struct WorkCellView: View {
    @State var experience: WorkExperience
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(experience.position)
                .font(.headline)
                .lineLimit(3)
                .padding(.bottom, 2)
            
            HStack {
                Text(experience.companyName)
                    .font(.subheadline)
                Divider()
                Text(experience.location.getLocationString())
                    .font(.subheadline)
            }
            HStack(alignment: .top) {
                experience.startDate.getDateString()
                Text("-")
                    .font(.subheadline)
                experience.endDate.getDateString()
            }
            .padding(.bottom, 16)
            
            List(experience.responsibilities, id: \.self) {
                Text("- " + $0)
                    .font(.body)
            }
        }
    }
    
}

#Preview {
    Form {
        WorkCellView(experience: WorkExperience(companyName: "Grab", location: Location(state: "Kuala Lumpur", country: "Malaysia"), position: "Associate Quality Engineer", startDate: Date(timeIntervalSinceNow: 167000), endDate: nil, responsibilities: ["Worked on iOS projects", "Delivered results"]))
    }
    
}
