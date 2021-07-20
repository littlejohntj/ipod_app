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
                       
   @Published var selected: Int = 0
   var items: [RowItem] =   [   RowItem(name: "Playlist", arrow: true),
                                RowItem(name: "Artists", arrow: true),
                                RowItem(name: "Albums", arrow: true),
                                RowItem(name: "Songs", arrow: true),
                                RowItem(name: "Genres", arrow: true),
                                RowItem(name: "Composers", arrow: true),
                                RowItem(name: "Audiobooks", arrow: true)
                            ]
                       
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
