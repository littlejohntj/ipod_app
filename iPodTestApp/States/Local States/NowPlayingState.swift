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
    
    var title: String = "Now Playing"
    var items: [RowItem] = []
    
    @Published var seekMode: Bool = false
    @Published var selected: Int = 0
    @Published var navigate: Bool = false
    
    func up() {
        print("up")
    }
    
    func down() {
        print("down")
    }
    
    func selfNavigate() {
        seekMode.toggle()
    }
    
}
