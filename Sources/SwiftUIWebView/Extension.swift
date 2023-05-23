//
//  File.swift
//  SwiftUIWebView
//
//  Created by devdchaudhary on 23/05/23.
//

import SwiftUI

extension URL {
    
    var isValidURL: Bool {
        return UIApplication.shared.canOpenURL(self)
    }
    
}
