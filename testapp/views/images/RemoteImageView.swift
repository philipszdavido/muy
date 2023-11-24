//
//  RemoteImageView.swift
//  testapp
//
//  Created by Chidume Nnamdi on 22/11/2023.
//

import SwiftUI

//struct RemoteImageView: View {
//    @State private var image: UIImage? = nil
//    let imageURL: URL
//
//    var body: some View {
//        if let image = image {
//            Image(uiImage: image)
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .frame(width: 100, height: 100) // Adjust the size as needed
//        } else {
//            // Placeholder or loading view while the image is being fetched
//            Text("Loading...")
//                .onAppear {
//                    loadImage()
//                }
//        }
//    }
//
//    private func loadImage() {
//        URLSession.shared.dataTask(with: imageURL) { data, response, error in
//            if let data = data, let loadedImage = UIImage(data: data) {
//                DispatchQueue.main.async {
//                    self.image = loadedImage
//                }
//            }
//        }.resume()
//    }
//}

//struct RemoteImageView2: View {
//    @State private var image: UIImage? = nil
//    let imageURL: URL
//
//    var body: some View {
//        if let image = image {
//            Image(uiImage: image)
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .frame(width: 100, height: 100) // Adjust the size as needed
//        } else {
//            // Placeholder or loading view while the image is being fetched
//            Text("Loading...")
//                .onAppear {
//                    loadImage()
//                }
//        }
//    }
//
//    private func loadImage() {
//        URLSession.shared.dataTask(with: imageURL) { data, response, error in
//            if let data = data, let loadedImage = UIImage(data: data) {
//                DispatchQueue.main.async {
//                    self.image = loadedImage
//                }
//            }
//        }.resume()
//    }
//}

struct RemoteImageView: View {
    @State private var image: UIImage? = nil
    let imageURL: URL

    var body: some View {
        if let image = image {
            Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100) // Adjust the size as needed
        } else {
            // Placeholder or loading view while the image is being fetched
            Text("Loading...")
                .onAppear {
                    if NetworkMonitor.shared.isConnected {
                        loadImage()
                    } else {
                        print("No internet connection")
                    }
                }
        }
    }

    private func loadImage() {
        URLSession.shared.dataTask(with: imageURL) { data, response, error in
            if let data = data, let loadedImage = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.image = loadedImage
                }
            }
        }.resume()
    }
}


struct RemoteImageView_Previews: PreviewProvider {
    static var previews: some View {
        RemoteImageView(imageURL: URL(string: "https://example.com/image.jpg")!)
    }
}
