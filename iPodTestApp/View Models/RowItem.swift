//
//  RowItem.swift
//  iPodTestApp
//
//  Created by TJ Littlejohn on 7/20/21.
//

import Foundation
import SwiftUI
import Combine
import MusicKit
import MediaPlayer

enum RowItemAccessory {
    case arrow
    case toggle
    case none
}

struct RowItem {
    
    init(name: String, arrow: Bool, song: MPMediaItem? = nil)  {
        self.name = name
        self.arrow = arrow
        self.song = song
    }
    
    let id = UUID()
    let name: String
    let arrow: Bool
    let song: MPMediaItem?
}
