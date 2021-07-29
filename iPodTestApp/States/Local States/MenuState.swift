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
    
    var onScreenItemCount: Int = 6
    var currentTop: Int = 0
    var currentBottom: Int = 5
    
    var title: String = "iPod"
    var proxy: ScrollViewProxy?
    var appState: AppState?
    var items: [RowItem] = [ RowItem(name: "Music", arrow: true),
                             RowItem(name: "Extras", arrow: true),
                             RowItem(name: "Settings", arrow: true),
                             RowItem(name: "Shuffle Songs", arrow: true),
                             RowItem(name: "Backlight", arrow: false) ]
    
    let maxNum: Int = 4
    
    @Published var selected: Int = 0
    @Published var navigate: Bool = false
    
    func selfNavigate() {
        if selected == 4 {
            appState?.backlight.toggle()
        } else {
            navigate = true
        }
    }
    
    
}
