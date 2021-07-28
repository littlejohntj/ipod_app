//
//  AppState.swift
//  iPodTestApp
//
//  Created by TJ Littlejohn on 7/20/21.
//

import Foundation
import Combine
import SwiftUI
import MusicKit
import MediaPlayer
import UIKit
import AVFoundation

class AppState: NSObject, ObservableObject, UIInputViewAudioFeedback {
    
    @Published var currentSong: MPMediaItem?
    @Published var backlight: Bool = true
    @Published var localState: LocalState?
    var bombSoundEffect: AVAudioPlayer?
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var stateDismiss: DismissAction?
        
    func up() {
        
        playSound()
        
        if let localState = self.localState {
            localState.up()
        }
    }
    
    func down() {
        
        playSound()
        
        if let localState = self.localState {
            localState.down()
        }
    }
    
    func setStateDismiss( dismiss: DismissAction ) {
        stateDismiss = dismiss
    }
    
    func setLocalState( localState: LocalState? ) {
        self.localState = localState
    }
    
    func selfNavigate() {
        self.localState?.selfNavigate()
    }
    
    func playCurrentTrackFromBegining() {
        if let song = currentSong {
            MPMusicPlayerController.systemMusicPlayer.setQueue(with: [song.playbackStoreID])
            MPMusicPlayerController.systemMusicPlayer.play()
        }
    }
    
    func currentTimePlayed() -> Int {
        return Int(MPMusicPlayerController.systemMusicPlayer.currentPlaybackTime)
    }
    
    func currentPlaybackString() -> String {
        let timeInSeconds = currentTimePlayed()
        return convertTimeToPlaybackString(time: timeInSeconds)
    }
    
    func convertTimeToPlaybackString( time: Int ) -> String {
        let timeInSeconds = Int(time)
        let minutes = timeInSeconds / 60
        let seconds = timeInSeconds % 60
        let secondsString = seconds < 10 ? "0\(seconds)" : "\(seconds)"
        return "\(minutes):\(secondsString)"
    }
    
    func endPlaybackString() -> String {
        
        if let playbackDuration = MPMusicPlayerController.systemMusicPlayer.nowPlayingItem?.playbackDuration {
            let timePassed = currentTimePlayed()
            let timeRemaining = Int(playbackDuration) - timePassed
            return "-\(convertTimeToPlaybackString(time: timeRemaining))"
        }
        
        return "0:00"
    }
    
    func playPause() {
        
        if SystemMusicPlayer.shared.playbackStatus == .playing {
            SystemMusicPlayer.shared.pause()
        } else if SystemMusicPlayer.shared.playbackStatus == .paused {
            SystemMusicPlayer.shared.play()
        }
    }
    
    func fowardSong() {
        SystemMusicPlayer.shared.skipToNextItem()
    }
    
    func backwardsSong() {
        SystemMusicPlayer.shared.skipToPreviousItem()
    }
    
    func prepareToPlay() {
        let urlPath = Bundle.main.url(forResource: "key_press_click", withExtension: "m4a")
        do {
            bombSoundEffect = try AVAudioPlayer(contentsOf: urlPath!)
            bombSoundEffect?.prepareToPlay()
        } catch {
            // couldn't load file :(
        }
    }
    
    func playSound() {
        async {
            bombSoundEffect?.play()
        }
    }
    
}
