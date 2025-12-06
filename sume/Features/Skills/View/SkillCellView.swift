//
//  SkillCellView.swift
//  sume
//
//  Created by Rezamir Rahizar on 06/12/2025.
//

import SwiftUI

struct SkillCellView: View {
    @State var skills: Skills
    
    var body: some View {
//        Section(header: Text("\(skills.type.rawValue.capitalized)")) {
//            List(skills.skills, id: \.self) {
//                Text($0)
//            }
//        }
        VStack(alignment: .leading) {
            Text("\(skills.type.rawValue.capitalized)")
                .font(.headline)
                .padding(.bottom, 8)
            List(skills.skills, id: \.self) {
                Text($0)
            }
        }
       
        
        
        
    }
}

#Preview {
    Form {
        SkillCellView(skills: Skills(
                                type: .soft,
                                skills: ["Speaking"]
                            )
        )
    }
    
}
