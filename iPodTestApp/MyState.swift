//
//  MyState.swift
//  iPodTestApp
//
//  Created by TJ Littlejohn on 7/5/21.
//

import Foundation
import Combine
import SwiftUI

struct RowItem {
    
    init(name: String, arrow: Bool, state: MyState? = nil)  {
        self.name = name
        self.arrow = arrow
        self.state = state
    }
    
    let id = UUID()
    let name: String
    let arrow: Bool
    var state: MyState?
}

class PodState: ObservableObject {
    
    
    
}

class MyState: ObservableObject {
    
    var backlight: Bool = true
    
    init( items: [RowItem] ) {
        self.items = items
    }
    
    init() {
        self.items = [ RowItem(name: "Music", arrow: true),
                       RowItem(name: "Extras", arrow: true),
                       RowItem(name: "Settings", arrow: true),
                       RowItem(name: "Shuffle Songs", arrow: true),
                       RowItem(name: "Backlight", arrow: false) ]
    }
    
    @Published var selected: Int = 0
    var stateDismiss: DismissAction?
    var items: [RowItem]
        
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
    
    func setStateDismiss( dismiss: DismissAction ) {
        stateDismiss = dismiss
    }
    
}

//class MusicState: ObservableObject, CanNavigate {
//
//    @Published var selected: Int = 0
//    var stateDismiss: DismissAction?
////    var select:(() -> ())? = nil
//
//    var items: [RowItem] = [ RowItem(name: "Playlists", arrow: true),
//                              RowItem(name: "Artists", arrow: true),
//                              RowItem(name: "Albums", arrow: true),
//                              RowItem(name: "Songs", arrow: true),
//                              RowItem(name: "Genres", arrow: true),
//                              RowItem(name: "Composers", arrow: true) ]
//
//    func up() {
//        if selected < 6 {
//            selected += 1
//        }
//    }
//
//    func down() {
//        if selected > 0 {
//            selected -= 1
//        }
//    }
//
//    func setStateDismiss( dismiss: DismissAction ) {
//        stateDismiss = dismiss
//    }
//
//}
