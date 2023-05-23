//
//  File.swift
//  
//
//  Created by devdchaudhary on 23/05/23.
//

import SwiftUI

public func isReachable(urlString: String, completion: @escaping (Bool) -> ()) {
    
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
        
        DispatchQueue.main.async {
            
            alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: { _ in
                
            }))
            
            UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true, completion: nil)
        }
            
        completion(false)
    }
    .resume()
    
}
