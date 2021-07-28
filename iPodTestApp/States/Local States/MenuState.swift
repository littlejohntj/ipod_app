//
//  MenuState.swift
//  iPodTestApp
//
//  Created by TJ Littlejohn on 7/20/21.
//

import Foundation
import SwiftUI
import Combine
import AudioToolbox
import AVFoundation

class MenuState: LocalState, ObservableObject {
    var title: String = "iPod"
    var proxy: ScrollViewProxy?
    var appState: AppState?
    var items: [RowItem] = [ RowItem(name: "Music", arrow: true),
                             RowItem(name: "Extras", arrow: true),
                             RowItem(name: "Settings", arrow: true),
                             RowItem(name: "Shuffle Songs", arrow: true),
                             RowItem(name: "Backlight", arrow: false) ]
    
    @Published var selected: Int = 0
    @Published var navigate: Bool = false
    
    func up() {
        if selected < items.count - 1 {
            selected += 1
        }
        
        if let proxy = proxy {
            proxy.scrollTo(selected, anchor: .bottom)
        }
    }
    
    func down() {
        if selected > 0 {
            selected -= 1
        }
        
        if let proxy = proxy {
            proxy.scrollTo(selected, anchor: .top)
        }
    }
    
    func selfNavigate() {
        if selected == 4 {
            appState?.backlight.toggle()
        } else {
            navigate = true
        }
    }
    
    
}
