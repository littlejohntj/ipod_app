//
//  AlbumState.swift
//  iPodTestApp
//
//  Created by TJ Littlejohn on 7/27/21.
//

import Foundation
import SwiftUI
import Combine
import AudioToolbox
import AVFoundation

class AlbumState: LocalState, ObservableObject {
    
    init ( title: String, items: [RowItem] ) {
        self.title = title
        self.items = items
    }
    
    var appState: AppState?
    var title: String = "Album"
    var items: [RowItem]
    var proxy: ScrollViewProxy?
    @Published var selected: Int = 0
    @Published var navigate: Bool = false
        
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
    
    func selfNavigate() {
        navigate = true
    }
    
    class func stateForAlbum( artist: String ) -> AlbumState {
        let items = MusicManager.allAlbums().map { RowItem(name: $0.title!, arrow: true, song: nil) }
        return AlbumState(title: artist, items: items)
    }
}
