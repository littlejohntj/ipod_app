//
//  SongState.swift
//  iPodTestApp
//
//  Created by TJ Littlejohn on 7/24/21.
//

import Foundation
import SwiftUI
import Combine

class SongState: LocalState, ObservableObject {
    
    init ( title: String, items: [RowItem] ) {
        self.title = title
        self.items = items
    }
                       
    @Published var selected: Int = 0
    @Published var navigate: Bool = false
    var proxy: ScrollViewProxy?
    
    var title: String
    var items: [RowItem]
                       
    func up() {
        if selected < items.count - 1 {
           selected += 1
        }
                
        if let proxy = proxy {
            proxy.scrollTo(selected, anchor: .center)
        }
    }

    func down() {
        if selected > 0 {
           selected -= 1
        }
        
        if let proxy = proxy {
            proxy.scrollTo(selected, anchor: .center)
        }
    }
    
    func selfNavigate() {
        navigate = true
    }
    
}
