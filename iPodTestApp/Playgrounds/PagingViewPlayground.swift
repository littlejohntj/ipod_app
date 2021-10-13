//
//  PagingViewPlayground.swift
//  PagingViewPlayground
//
//  Created by TJ Littlejohn on 8/9/21.
//

import Foundation
import SwiftUI

struct PagingView: View {
    
    var body: some View {
        TabView {
            ForEach(0..<2) { i in
                
                if i == 0 {
                    ZStack {
                        Color.blue.ignoresSafeArea()
                        Text("Sup")
                            .foregroundColor(Color.white)
                    }
                } else {
                    
                }
            }
        }
        .tabViewStyle(PageTabViewStyle())
    }
    
}

struct PagingViewPreview: PreviewProvider {
    static var previews: some View {
        Group {
            PagingView()
        }
    }
}
