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
    
    var onScreenItemCount: Int = 6
    var currentTop: Int = 0
    var currentBottom: Int = 5
    
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
    
    func selfNavigate() {
        navigate = true
    }

}
