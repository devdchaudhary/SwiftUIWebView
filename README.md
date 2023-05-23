# SwiftUIWebView - A UIKit Wrapper for showing WebViews in SwiftUI

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

Usage

Step 1 : Import SwiftUIWebView

Step 2 : Call the WebView Constructor

```
import SwiftUI
import SwiftUIWebView

struct SwiftUIView: View {

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

![Playback demo](/Media/vid1.mp4)

You can also use the `isReachable` function to check if a website is valid or not.

```
import SwiftUI
import SwiftUIWebView

struct SwiftUIView: View {

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

![Playback demo](/Media/vid2.gif)
<img src="/Media/vid2.gif" width=50% height=50%>




