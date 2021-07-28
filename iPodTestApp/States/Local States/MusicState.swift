//
//  MusicState.swift
//  iPodTestApp
//
//  Created by TJ Littlejohn on 7/20/21.
//

import Foundation
import SwiftUI
import Combine

class MusicState: LocalState, ObservableObject {
    
    var title: String = "Music"
    var proxy: ScrollViewProxy?
    @Published var selected: Int = 0
    @Published var navigate: Bool = false
    var items: [RowItem] =   [   RowItem(name: "Playlist", arrow: true),
                                RowItem(name: "Artists", arrow: true),
                                RowItem(name: "Albums", arrow: true),
                                RowItem(name: "Songs", arrow: true),
                                RowItem(name: "Genres", arrow: true),
                                RowItem(name: "Composers", arrow: true)
                            ]
                       
   func up() {
       if selected < items.count - 1 {
           selected += 1
       }
       
       print("up")
       
       if let proxy = proxy {
           proxy.scrollTo(selected, anchor: .bottom)
       }
   }
   
   func down() {
       if selected > 0 {
           selected -= 1
       }
       
       print("down")
       
       if let proxy = proxy {
           proxy.scrollTo(selected, anchor: .top)
       }
   }
    
    func selfNavigate() {
        navigate = true
    }

}
