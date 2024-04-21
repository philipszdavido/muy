//
//  BrokenCircle.swift
//  testapp
//
//  Created by Chidume Nnamdi on 19/12/2023.
//

import SwiftUI

struct BrokenCircleView<Content: View>: View {
    var size: CGFloat
    var content: Content

    init(size: CGFloat = 100, @ViewBuilder content: () -> Content) {
        self.size = size
        self.content = content()
    }

    var body: some View {
        Circle()
            .stroke(style: StrokeStyle(lineWidth: 5, dash: [10]))
            .foregroundColor(Color.blue)
            .frame(width: size, height: size)
            .overlay(content)
    }
}

#Preview {
    BrokenCircleView(size: 200) {
        Text("Hello, SwiftUI!")
            .foregroundColor(.blue)
    }
}

