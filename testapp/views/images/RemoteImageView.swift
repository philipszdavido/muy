//
//  RemoteImageView.swift
//  testapp
//
//  Created by Chidume Nnamdi on 22/11/2023.
//

import SwiftUI

struct RemoteImageView: View {
    var imageURL: URL?
    var size: CGFloat
    var borderThickness: CGFloat
    var borderColor: Color
    
    init(imageURL: String, size: CGFloat = 100, borderThickness: CGFloat = 1, borderColor: Color = .white) {
        self.imageURL = URL(string: imageURL)
        self.size = size
        self.borderThickness = borderThickness
        self.borderColor = borderColor
    }


    var body: some View {
        AsyncImage(url: imageURL)
//            .resizable()
            .scaledToFit()
            .frame(width: size, height: size)
            .clipShape(Circle())
            .overlay(Circle().stroke(borderColor, lineWidth: borderThickness))

        }
}


struct RemoteImageView_Previews: PreviewProvider {
    static var previews: some View {
        RemoteImageView(imageURL: "https://avatars.githubusercontent.com/u/25048922?v=4")
    }
}
