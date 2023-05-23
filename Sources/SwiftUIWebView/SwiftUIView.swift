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
            
            if isValidURL(url: url) {
                
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
    
    public func isValidURL(url: URL) -> Bool {
        
        if UIApplication.shared.canOpenURL(url) {
            
            return true
            
        } else {
            
            let alert = UIAlertController(title: "Invalid URL", message: "This website doensn't exist.", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: { _ in
                dismissView()
            }))
            
            UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true, completion: nil)
            
            return false
            
        }
    }
    
    private func dismissView() {
        presentationMode.wrappedValue.dismiss()
    }
    
}
