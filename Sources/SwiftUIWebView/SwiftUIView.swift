//
//  SwiftUIView.swift
//  
//
//  Created by devdchaudhary on 23/05/23.
//

import SwiftUI

public struct WebView: View {
    
    @Environment(\.dismiss) var dismiss
    @Environment(\.colorScheme) var colorScheme
    
    @Binding var url: String
    
    var showProgressBar: Bool
    var tintColor: Color?
    
    @State private var didLoad = false
    
    public init(url: Binding<String>, showProgressBar: Bool, tintColor: Color? = nil) {
        self._url = url
        self.showProgressBar = showProgressBar
        self.tintColor = tintColor
    }
    
    public var body: some View {
        
        VStack {
            
            HStack {
                
                Button(action: dismissView) {
                    Image(systemName: "xmark")
                        .foregroundColor(colorScheme == .dark ? .white : .black)
                        .font(.system(size: 18))
                    
                }
                
                Spacer()
                
            }
            .padding(.horizontal)
            
            Spacer()
                                                                
            ZStack {
                
                WebRepresentable($url.wrappedValue) {
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
        dismiss()
    }
    
}
