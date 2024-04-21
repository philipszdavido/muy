//
//  LinearViewUpdateProgressView.swift
//  testapp
//
//  Created by Chidume Nnamdi on 27/11/2023.
//

import SwiftUI

struct LinearViewUpdateProgressView: View {
    @State private var progress: CGFloat = 0.1

    var body: some View {
        GeometryReader { geometry in
            Rectangle()
                .foregroundColor(.gray) // Background color
                .frame(height: 5) // Adjust height as needed
                .cornerRadius(3.0) // Adjust corner radius as needed
                .overlay(
                    Rectangle()
                        .foregroundColor(Color.black) // Solid black color
                        .frame(width: geometry.size.width * self.progress, height: 5)
                        .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
// Match the height of the background rectangle
                        .offset(x: -geometry.size.width * (1.0 - self.progress) / 2.0) // Adjust the offset to start at the left of the blue rectangle
                        .animation(.linear(duration: 1.0)) // Adjust the animation duration as needed
                )
        }
    }
}

#Preview {
    LinearViewUpdateProgressView()
}
