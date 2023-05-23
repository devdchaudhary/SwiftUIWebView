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
                        .foregroundColor(colorScheme == .dark ? .white : .black)
                        .font(.system(size: 15))
                    
                }
                
                Spacer()
                
            }
            .padding(.horizontal)
            
            Spacer()
                            
            if isValidURL(url).0 == true {
                
                ZStack {
                    
                    WebRepresentable(isValidURL(url).1) {
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
    
    func isValidURL(_ urlString: String) -> (Bool, URL?) {
        
        if let url = NSURL(string: urlString) {
            return (UIApplication.shared.canOpenURL(url as URL), URL(string: urlString))
        }
        
        let alert = UIAlertController(title: "Invalid URL", message: "This website doensn't exist.", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: { _ in
            dismissView()
        }))
        
        UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true, completion: nil)
        
        return (false, nil)
    }
    
    private func dismissView() {
        presentationMode.wrappedValue.dismiss()
    }
    
}
