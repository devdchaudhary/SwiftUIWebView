//
//  SwiftUIView.swift
//  
//
//  Created by devdchaudhary on 23/05/23.
//

import SwiftUI

@available(iOS 14.0, *)
struct WebView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.colorScheme) var colorScheme
    
    @Binding var url: String
    @Binding var showProgressBar: Bool
    @State private var didLoad = false
    
    var body: some View {
        
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
