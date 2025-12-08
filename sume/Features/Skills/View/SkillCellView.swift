//
//  SkillCellView.swift
//  sume
//
//  Created by Rezamir Rahizar on 06/12/2025.
//

import SwiftUI

struct SkillCellView: View {
    @Binding var skills: Skills
    
    var body: some View {
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
    let mockData = Skills(
        type: .soft,
        skills: ["Speaking"]
    )
    PreviewStateWrapper(mockData) { binding in
        Form {
            SkillCellView(skills: binding)
        }
    }
}
