//
//  PersonalDetailsView.swift
//  sume
//
//  Created by Rezamir Rahizar on 05/12/2025.
//

import SwiftUI

struct PersonalDetailsView: View {
    @State var details: PersonalDeets
    
    var body: some View {
        //Name
        TextField("First Name", text: $details.firstName)
        let lastNameBinding = Binding($details.lastName)
        if let lastNameBinding {
            TextField("Last Name", text: lastNameBinding)
        }
        let nickNameBinding = Binding($details.preferredName)
        if let nickNameBinding {
            TextField("Preferred Name", text: nickNameBinding)
        }
        
        //Email
        TextField("Email", text: $details.email)
        
        //Location
        HStack {
            if let stateBinding = Binding($details.address.state) {
                TextField("State", text: stateBinding)
                Divider()
            }
            
            TextField("Country", text: $details.address.country)
        }
        if let nationalBinding = Binding($details.nationality) {
            TextField("Nationality", text: nationalBinding)
        }
        
    }
}

#Preview {
    Form {
        PersonalDetailsView(details: PersonalDeets(firstName: "Joe", lastName:"Doe", email: "joe@email.com", address: Location(state: "Selangor", country: "Malaysia"), nationality: "Korean"))
    }
    
}
