# ImageOCRUI

ImageOCRUI is a powerful OCR (Optical Character Recognition) package developed in SwiftUI, allowing you to seamlessly scan and extract text from images. Leveraging the Vision and VisionKit frameworks, this package provides accurate and efficient text recognition capabilities for your iOS apps.

##  Features
- Scan and extract text from images effortlessly with Vision and VisionKit integration.
- Simple and intuitive SwiftUI-based UI for a smooth user experience.
- Multiple text recognition support, enabling extraction from multiple pages or regions within an image.
- Easily customize the UI and integration into your existing SwiftUI projects.
  
## Requirements

- Swift 5 or later
- iOS 15.0 or later

## Installation

You can include this package in your project via Swift Package Manager. In your Xcode project, go to "File" -> "Swift Packages" -> "Add Package Dependency" and add the following URL:

```url
https://github.com/fatihdurmaz/ImageOCRUI
```


## Usage/Examples

```swift

import SwiftUI
import ImageOCRUI

struct ContentView: View {
    @State private var texts: [ScannedText] = []
    @State private var showScannerSheet = false
    
    var body: some View {
        NavigationView {
            VStack {
                List(texts) { text in
                    Text(text.scannedText)
                }
            }
            .navigationTitle("OCR Image to Text")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Scan") {
                        showScannerSheet = true
                    }
                    .sheet(isPresented: $showScannerSheet) {
                        self.createScannerView()
                    }
                }
            }
        }
    }
    
    private func createScannerView() -> ScannerView {
        ScannerView(completion: { detectedTextPerPage in
            if let concatenatedText = detectedTextPerPage?.joined(separator: "\n").trimmingCharacters(in: .whitespacesAndNewlines) {
                let scannedData = ScannedText(scannedText: concatenatedText)
                self.texts.append(scannedData)
            }
            self.showScannerSheet = false
        })
    }
}

```

