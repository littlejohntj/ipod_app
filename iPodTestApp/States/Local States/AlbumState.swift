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
    
    var onScreenItemCount: Int = 6
    var currentTop: Int = 0
    var currentBottom: Int = 5
    
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
    
    func selfNavigate() {
        navigate = true
    }
    
    class func stateForAlbum( artist: String ) -> AlbumState {
        let items = MusicManager.allAlbums().map { RowItem(name: $0.title!, arrow: true, song: nil) }
        return AlbumState(title: artist, items: items)
    }
}
