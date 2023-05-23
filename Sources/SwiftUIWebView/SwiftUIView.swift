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
        .onAppear {
            isReachable(urlString: url) { success in
                if success {
                    isValidURL = true
                }
            }
        }
    }
    
    func isReachable(urlString: String, completion: @escaping (Bool) -> ()) {
        
        guard let url = URL(string: urlString) else {
            
            completion(false)
            return
        }
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "HEAD"
        
        URLSession.shared.dataTask(with: request) { _, response, _ in
            
            let status = response as? HTTPURLResponse
            
            if status?.statusCode == 200 {
                
                completion(true)
            }
            
            let alert = UIAlertController(title: "Invalid URL", message: "This website doesn't exist.", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: { _ in
                dismissView()
            }))
            
            UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true, completion: nil)
            completion(false)
        }
        .resume()
        
    }
    
    private func dismissView() {
        presentationMode.wrappedValue.dismiss()
    }
    
}
