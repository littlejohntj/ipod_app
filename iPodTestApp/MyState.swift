//
//  MyState.swift
//  iPodTestApp
//
//  Created by TJ Littlejohn on 7/5/21.
//

import Foundation
import Combine
import SwiftUI

struct RowItem: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let arrow: Bool
}

class MyState: ObservableObject {
    
    @Published var selected: Int = 0
    var stateDismiss: DismissAction?
    var select:(() -> ())? = nil
    
    var items: [RowItem] = [ RowItem(name: "Music", arrow: true),
                             RowItem(name: "Extras", arrow: true),
                             RowItem(name: "Settings", arrow: true),
                             RowItem(name: "Shuffle Songs", arrow: true),
                             RowItem(name: "Backlight", arrow: false) ]
    
    func up() {
        if selected < 4 {
            selected += 1
        }
    }
    
    func down() {
        if selected > 0 {
            selected -= 1
        }
    }
    
}
