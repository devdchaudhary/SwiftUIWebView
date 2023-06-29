//
//  SwiftUIView.swift
//  
//
//  Created by devdchaudhary on 23/05/23.
//

import SwiftUI

public struct WebView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.colorScheme) var colorScheme
    
    var url: String
    var showProgressBar: Bool
    var tintColor: Color
    
    @State private var didLoad = false
    
    public init(url: String, showProgressBar: Bool, tintColor: Color) {
        self.url = url
        self.showProgressBar = showProgressBar
        self.tintColor = tintColor
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
                                                                
            ZStack {
                
                WebRepresentable(url) {
                    didLoad = true
                }
                
                if showProgressBar {
                    if !didLoad {
                        ProgressView()
                            .tint(tintColor)
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
