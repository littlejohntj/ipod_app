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
    
    var items: [RowItem] = [  ]
    
    @Published var selected: Int = 0
    
    func up() {
        print("up")
    }
    
    func down() {
        print("down")
    }
    
}
