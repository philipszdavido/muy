import SwiftUI

struct CircleAvatar: View {
    var imageName: String
    var size: CGFloat
    var borderThickness: CGFloat
    var borderColor: Color

    init(imageName: String, size: CGFloat = 100, borderThickness: CGFloat = 2, borderColor: Color = .white) {
        self.imageName = imageName
        self.size = size
        self.borderThickness = borderThickness
        self.borderColor = borderColor
    }

    var body: some View {
        Image(systemName: "newspaper")
            .resizable()
            .scaledToFit()
            .frame(width: size, height: size)
            .clipShape(Circle())
            .overlay(Circle().stroke(borderColor, lineWidth: borderThickness))
    }
}

struct CircleAvatar_Previews: PreviewProvider {
    static var previews: some View {
        CircleAvatar(imageName: "your_image_name")
    }
}
