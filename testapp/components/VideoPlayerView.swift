//
//  VideoPlayerView.swift
//  testapp
//
//  Created by Chidume Nnamdi on 27/11/2023.
//
import SwiftUI
import AVKit

struct VideoPlayerView: UIViewControllerRepresentable {
    var videoURL: URL

    func makeUIViewController(context: Context) -> AVPlayerViewController {
        let player = AVPlayer(url: videoURL)
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        return playerViewController
    }

    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {}
}

struct VideoPlayerViewTest: View {
    var body: some View {
        VideoPlayerView(videoURL: URL(string: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4")!)
            .edgesIgnoringSafeArea(.all)
    }
}

struct VideoPlayerViewTest_Previews: PreviewProvider {
    static var previews: some View {
        VideoPlayerViewTest()
    }
}
