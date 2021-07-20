//
//  MenuState.swift
//  iPodTestApp
//
//  Created by TJ Littlejohn on 7/20/21.
//

import Foundation
import SwiftUI
import Combine

class MenuState: LocalState, ObservableObject {
    
    init() {
        self.items = [ RowItem(name: "Music", arrow: true),
                       RowItem(name: "Extras", arrow: true),
                       RowItem(name: "Settings", arrow: true),
                       RowItem(name: "Shuffle Songs", arrow: true),
                       RowItem(name: "Backlight", arrow: false) ]
    }
    
    var items: [RowItem]
    @Published var selected: Int = 0
    
    func up() {
        if selected < items.count - 1 {
            selected += 1
        }
    }
    
    func down() {
        if selected > 0 {
            selected -= 1
        }
    }
    
}
