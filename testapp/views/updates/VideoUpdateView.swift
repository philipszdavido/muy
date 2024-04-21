//
//  VideoUpdateView.swift
//  testapp
//
//  Created by Chidume Nnamdi on 23/11/2023.
//
//
//import SwiftUI
//import UIKit
//
//struct _CameraView: UIViewControllerRepresentable {
//    @Binding var isCameraViewPresented: Bool
//    @Binding var capturedImage: UIImage?
//
//    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
//        var parent: _CameraView
//
//        init(parent: _CameraView) {
//            self.parent = parent
//        }
//
//        func imagePickerController(_ picker: UIImagePickerController,
//                                   didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//            if let image = info[.originalImage] as? UIImage {
//                parent.capturedImage = image
//            }
//            parent.isCameraViewPresented = false
//        }
//
//        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
//            parent.isCameraViewPresented = false
//        }
//    }
//
//    func makeCoordinator() -> Coordinator {
//        return Coordinator(parent: self)
//    }
//
//    func makeUIViewController(context: Context) -> UIViewController {
//        let viewController = UIViewController()
//        let imagePicker = UIImagePickerController()
//        imagePicker.delegate = context.coordinator
//        imagePicker.sourceType = .camera
//        viewController.present(imagePicker, animated: true, completion: nil)
//        return viewController
//    }
//
//    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
//        // Update the UI if needed
//    }
//}
//
//struct VideoUpdateView: View {
//    @State private var isCameraViewPresented = false
//    @State private var capturedImage: UIImage?
//
//    var body: some View {
//        VStack {
//            Button("Open Camera") {
//                isCameraViewPresented.toggle()
//            }
//            .sheet(isPresented: $isCameraViewPresented) {
//                _CameraView(isCameraViewPresented: $isCameraViewPresented, capturedImage: $capturedImage)
//            }
//
//            if let image = capturedImage {
//                Image(uiImage: image)
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .frame(width: 200, height: 200)
//            }
//        }
//    }
//}
//
//#Preview {
//    VideoUpdateView()
//}
