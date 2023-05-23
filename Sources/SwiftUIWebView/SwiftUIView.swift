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
    
    var url: String
    var showProgressBar: Bool
    @State private var didLoad = false
    @State private var isValidURL = false
    
    public init(url: String, showProgressBar: Bool) {
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
                                            
                if isValidURL {
                    
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
                }
            
            Spacer()
            
        }
        .navigationBarBackButtonHidden()
        
    }
    
    private func dismissView() {
        presentationMode.wrappedValue.dismiss()
    }
    
}
