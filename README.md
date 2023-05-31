# SwiftUIWebView - A WKWebView Wrapper for SwiftUI

A UIKit Wrapper for SwiftUI to be able to show users WebViews while staying inside your app using the WebKit Framework.

It uses WKWebView to show this.

Requirements

iOS 14,
Swift 5.0
Xcode 13.0+

Installation

Swift Package Manager

To integrate SwiftUIWebView into your Xcode project, specify it in Package Dependancies > Click the "+" button > Copy and paste the URL below:

```https://github.com/devdchaudhary/SwiftUIWebView```

set branch to "master"

Check SwiftUIWebview

Click Add to Project

https://github.com/devdchaudhary/SwiftUIWebView/assets/52855516/fa60e200-b78e-4be6-95fa-b4de4d922c20

Usage

Step 1 : Import SwiftUIWebView

Step 2 : Call the WebView Constructor

```
import SwiftUI
import SwiftUIWebView

struct SwiftUIView: View {

    @State private var showSheet = false
    var url = "https://www.devdchaudhary.com"
        
    var body: some View {
        
        VStack {

            Button {
               showSheet.toggle()
            } label: {
                Text("Show Sheet")
            }
            
        }
        .fullScreenCover(isPresented: $showSheet) {
            WebView(url: url, showProgressBar: true)
        }
    }
}
```

Additionally you can pass a boolean for showing a progress bar.

https://github.com/devdchaudhary/SwiftUIWebView/assets/52855516/5a88b7e4-cd2c-4a0f-8c97-a21c36fa4479

You can also use the `isReachable` function to check if a website is valid or not.

```
import SwiftUI
import SwiftUIWebView

struct SwiftUIView: View {

    @State private var showSheet = false
    var url = "invalidWebsite.com"
        
    var body: some View {
        
        VStack {

            Button {
                
                isReachable(urlString: url) { success in
                    if success {
                        showSheet.toggle()
                    }
                }
                
            } label: {
                Text("Show Sheet")
            }
            
        }
        .fullScreenCover(isPresented: $showSheet) {
            WebView(url: url, showProgressBar: true)
        }
    }
}

```

https://github.com/devdchaudhary/SwiftUIWebView/assets/52855516/bbe83ba0-8dca-4e76-9a93-0b269bad0604




