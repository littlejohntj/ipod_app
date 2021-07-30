//
//  NowPlayingState.swift
//  iPodTestApp
//
//  Created by TJ Littlejohn on 7/21/21.
//

import Foundation
import SwiftUI
import Combine

class NowPlayingState: LocalState, ObservableObject {
    
    var proxy: ScrollViewProxy?
    var appState: AppState?
    var onScreenItemCount: Int = 6
    var currentTop: Int = 0
    var currentBottom: Int = 5
    
    var title: String = "Now Playing"
    var items: [RowItem] = []
    
    @Published var seekMode: Bool = false
    @Published var selected: Int = 0
    @Published var navigate: Bool = false
    
    func up() {
        print("up")
        appState?.seekSong()
    }
    
    func down() {
        print("down")
    }
    
    func selfNavigate() {
        seekMode.toggle()
    }
    
}
