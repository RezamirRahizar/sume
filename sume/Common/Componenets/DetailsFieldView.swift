//
//  DetailsFieldView.swift
//  sume
//
//  Created by Rezamir Rahizar on 26/01/2026.
//

import SwiftUI

struct DetailsFieldView: View {
    var title: String
    var institute: String
    var location: Location
    var startDate: Date
    var endDate: Date?
    var detailsList: [String]?
    
    var body: some View {
        VStack (alignment: .leading) {
            HStack(alignment: .top) {
                Text(title)
                    .font(.headline)
                    .lineLimit(3)
                    .padding(.bottom, 2)
                Spacer()
                getDateString()
                    .font(.subheadline)
                    .padding(.bottom, 16)
            }
            
            
            HStack {
                Text(institute)
                Divider()
                    .frame(height: 16)
                Text(location.getLocationString())
            }
            .font(.subheadline)
            
           
            if let detailsList {
                ForEach(detailsList, id: \.self ) { detail in
                    Text("- " + detail)
                        .font(.body)
                }
            }
        }
//        .background(.red)

        
        
    }
    
    private func getDateString() -> some View {
        HStack {
            Text(startDate.getDateString())
            Text("-")
            Text(endDate.getDateString())
        }
    }
}
 


#Preview("Work") {
    DetailsFieldPreview(isWorkExperience: true)
}

#Preview("Education") {
    DetailsFieldPreview(isWorkExperience: false)
}


private struct DetailsFieldPreview: View {
    private let workExp: WorkExperience = Mocker.workHistory[0]
    private let education: Education = Mocker.education[0]
    
    var isWorkExperience: Bool = false
    var body: some View {
        if isWorkExperience {
            DetailsFieldView(
                title: workExp.position,
                institute: workExp.companyName,
                location: workExp.location,
                startDate: workExp.startDate,
                endDate: workExp.endDate,
                detailsList: workExp.responsibilities
            )
        } else {
            DetailsFieldView(
                title: education.getEducationLevelString(),
                institute: education.institution,
                location: education.location,
                startDate: education.startDate,
                endDate: education.endDate,
            )
        }
        
    }
    
}
