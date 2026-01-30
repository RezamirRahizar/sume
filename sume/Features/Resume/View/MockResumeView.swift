//
//  MockResumeView.swift
//  sume
//
//  Created by Rezamir Rahizar on 21/01/2026.
//
import SwiftUI

struct MockResumeView: View {
    let dict: [String: String] = [
        "Name": "Alice",
        "Email": "alice@example.com",
        "Notes": "Line 1\nLine 2 with longer text that should wrap properly in the PDF."
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            ForEach(dict.sorted(by: { $0.key < $1.key }), id: \.key) { key, value in
                HStack(alignment: .top) {
                    Text(key + ":")
                        .font(.headline)
                        .frame(minWidth: 120, alignment: .leading)
                    Text(value)
                        .font(.body)
                        .fixedSize(horizontal: false, vertical: true)
                }
                Divider()
            }
            Spacer()
        }
        .padding(20)
        .background(Color.white) 
    }
}


#Preview {
    MockResumeView()
}
