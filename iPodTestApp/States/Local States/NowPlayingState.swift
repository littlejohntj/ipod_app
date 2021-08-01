//
//  NowPlayingState.swift
//  iPodTestApp
//
//  Created by TJ Littlejohn on 7/21/21.
//

import Foundation
import SwiftUI
import Combine

enum SeekState {
    case barProgress
    case diamondProgress
    case diamondScroll
}

class NowPlayingState: LocalState, ObservableObject {
    
    var proxy: ScrollViewProxy?
    var appState: AppState?
    var onScreenItemCount: Int = 6
    var currentTop: Int = 0
    var currentBottom: Int = 5
    @Published var seekState: SeekState = .barProgress
    
    @Published var deltaLeftRatio: CGFloat = 0
    @Published var deltaRightRatio: CGFloat = 0
    
    @Published var deltaLeftText: String = "0:00"
    @Published var deltaRightText: String = "0:00"
    
    var title: String = "Now Playing"
    var items: [RowItem] = []
    
    @Published var selected: Int = 0
    @Published var navigate: Bool = false
    
    func gatherDeltaStrings() {
        if let appState = appState {
            deltaLeftText = appState.deltaCurrentPlaybackString( percent: deltaLeftRatio )
            deltaRightText = appState.deltaEndPlaybackString( percent: deltaLeftRatio )
        }
    }
    
    func gatherRatios() {
        if let appState = appState {
            deltaLeftRatio = appState.songPlayedRatio()
            deltaRightRatio = appState.songRemainingRatio()
        }
    }
    
    func up() {
        if seekState == .diamondProgress {
            seekState = .diamondScroll
            gatherRatios()
        }
        
        if seekState == .diamondScroll {
            if deltaRightRatio > 0 {
                deltaRightRatio -= 0.02
                deltaLeftRatio  += 0.02
                gatherDeltaStrings()
            }
        }
    }
    
    func down() {
        if seekState == .diamondProgress {
            seekState = .diamondScroll
            gatherRatios()
        }
        
        if seekState == .diamondScroll {
            if deltaLeftRatio > 0 {
                deltaLeftRatio -= 0.02
                deltaRightRatio += 0.02
                gatherDeltaStrings()
            }
        }
    }
    
    func selfNavigate() {
        
        if seekState == .barProgress {
            seekState = .diamondProgress
        } else if seekState == .diamondProgress {
            seekState = .barProgress
        } else if seekState == .diamondScroll {
            appState?.seekSong(percent: deltaLeftRatio)
            seekState = .barProgress
        }
    }
}
