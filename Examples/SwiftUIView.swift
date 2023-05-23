//
//  SwiftUIView.swift
//  
//
//  Created by devdchaudhary on 23/05/23.
//

import SwiftUI

struct SwiftUIView: View {

    @State private var showSheet = false
    var url = "https://www.devdchaudhary.com"
        
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

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
