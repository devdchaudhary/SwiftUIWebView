//
//  SwiftUIView.swift
//  
//
//  Created by devdchaudhary on 23/05/23.
//

import SwiftUI

@available(iOS 14.0, *)
public struct WebView: View {

    @Environment(\.presentationMode) var presentationMode
    @Environment(\.colorScheme) var colorScheme
    
    var url: URL
    var showProgressBar: Bool
    @State private var didLoad = false
    
    public init(url: URL, showProgressBar: Bool) {
        self.url = url
        self.showProgressBar = showProgressBar
    }

    public var body: some View {
        
        VStack {
            
            HStack {
                                
                Button(action: dismissView) {
                    Image(systemName: "xmark")
                        .foregroundColor(colorScheme == .dark ? .white : .black)
                        .font(.system(size: 15))
                    
                }
                
                Spacer()
                
            }
            .padding(.horizontal)
            
            Spacer()
            
            if url.isValidURL {
                
                ZStack {
                    
                    WebRepresentable(url) {
                        didLoad = true
                    }
                    
                    if showProgressBar {
                        if !didLoad {
                            ProgressView()
                        }
                    }
                }
                
            } else {
                
                Text("Invalid URL")
                    .foregroundColor(colorScheme == .dark ? .white : .black)
                    .font(.system(size: 15))

            }
            
            Spacer()
            
        }
        .navigationBarBackButtonHidden()
    }
    
    private func dismissView() {
        presentationMode.wrappedValue.dismiss()
    }
    
}
