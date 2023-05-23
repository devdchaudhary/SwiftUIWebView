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
    
    public init(url: String, showProgressBar: Bool) {
        self.url = url
        self.showProgressBar = showProgressBar
    }

    public var body: some View {
        
        VStack {
            
            HStack {
                                
                Button(action: dismissView) {
                    Image(systemName: "xmark")
                        .foregroundColor(.black)
                        .font(.system(size: 15))
                    
                }
                
                Spacer()
                
            }
            .padding(.horizontal)
            
            Spacer()
            
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
            
            Spacer()
            
        }
        .navigationBarBackButtonHidden()
    }
    
    private func dismissView() {
        presentationMode.wrappedValue.dismiss()
    }
    
}
