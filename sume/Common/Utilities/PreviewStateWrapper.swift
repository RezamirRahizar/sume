//
//  PreviewStateWrapper.swift
//  sume
//
//  Created by Rezamir Rahizar on 08/12/2025.
//

import SwiftUI

struct PreviewStateWrapper<Value>: View {
    @State var value: Value
    let content: (Binding<Value>) -> AnyView
    
    init(_ value: Value, @ViewBuilder content: @escaping (Binding<Value>) -> some View) {
        self._value = State(initialValue: value)
        self.content = { AnyView(content($0)) }
    }
    
    var body: some View {
        content($value)
    }
}
