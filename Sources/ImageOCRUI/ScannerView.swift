//
//  SwiftUIView.swift
//  
//
//  Created by Fatih Durmaz on 24.07.2023.
//

import VisionKit
import SwiftUI

public struct ScannerView: UIViewControllerRepresentable {
    public let completionHandler: ([String]?) -> Void
     
    public init(completion: @escaping ([String]?) -> Void) {
        self.completionHandler = completion
    }
     
    public typealias UIViewControllerType = VNDocumentCameraViewController
     
    public func makeUIViewController(context: UIViewControllerRepresentableContext<ScannerView>) -> VNDocumentCameraViewController {
        let viewController = VNDocumentCameraViewController()
        viewController.delegate = context.coordinator
        return viewController
    }
     
    public func updateUIViewController(_ uiViewController: VNDocumentCameraViewController, context: UIViewControllerRepresentableContext<ScannerView>) {}
     
    public func makeCoordinator() -> Coordinator {
        return Coordinator(completion: completionHandler)
    }
     
    final public class Coordinator: NSObject, VNDocumentCameraViewControllerDelegate {
        public let completionHandler: ([String]?) -> Void
         
        init(completion: @escaping ([String]?) -> Void) {
            self.completionHandler = completion
        }
         
        public func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFinishWith scan: VNDocumentCameraScan) {
            print("Document camera view controller did finish with ", scan)
            let recognizer = TextRecognizer(cameraScan: scan)
            recognizer.recognizeText(withCompletionHandler: completionHandler)
        }
         
        public func documentCameraViewControllerDidCancel(_ controller: VNDocumentCameraViewController) {
            completionHandler(nil)
        }
         
        public func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFailWithError error: Error) {
            print("Document camera view controller did finish with error ", error)
            completionHandler(nil)
        }
    }
}

