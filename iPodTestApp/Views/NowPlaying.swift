//
//  NowPlayingView.swift
//  iPodTestApp
//
//  Created by TJ Littlejohn on 7/21/21.
//

import Foundation
import SwiftUI
import Combine
import MusicKit
import MediaPlayer

struct NowPlayingView: View {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var appState: AppState
    @StateObject var nowPlayingState: NowPlayingState = NowPlayingState()
    var song: MPMediaItem
    
    var body: some View {
        ZStack {
            Theme.colors.lightColor.edgesIgnoringSafeArea(.all)
            NowPlaying(nowPlayingState: nowPlayingState)
        }
        .onAppear {
            nowPlayingState.appState = appState
            appState.setStateDismiss(dismiss: dismiss)
            appState.setLocalState(localState: nowPlayingState)
            
            print( "mfcats \(song.playbackStoreID)" )
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

struct NowPlaying: View {
    @EnvironmentObject var appState: AppState
    @StateObject var nowPlayingState: NowPlayingState
    
    @State var trackText: String = ""
    var body: some View {
        VStack {
            HStack {
                Text(trackText)
                    .font(.custom("Chicago", size: 18))
                Spacer()
            }
            .padding(.leading, 10)
            Spacer()
            TrackInfoView()
            Spacer()
            TimeTracker(localState: nowPlayingState)
                .padding([.leading, .trailing, .bottom], 10)
        }
        .onReceive(appState.timer) { time in
            trackText = "\(appState.currentSong()!.albumTrackNumber) of \(appState.currentSong()!.albumTrackCount)"
        }
        .font(.custom("Chicago", size: 22))
        .foregroundColor(Theme.colors.darkColor)
    }
}

struct TrackInfoView: View {
    @EnvironmentObject var appState: AppState
    
    @State var title: String = ""
    @State var artist: String = ""
    @State var album: String = ""
    
    var body: some View {
        VStack {
            Text(title)
            Text(artist)
            Text(album)
        }
        .padding(10)
        .onReceive(appState.timer) { time in
            
            if let title = appState.currentSong()?.title {
                self.title = title
            }
            
            if let artist = appState.currentSong()?.artist {
                self.artist = artist
            }
            
            if let album = appState.currentSong()?.albumTitle {
                self.album = album
            }
        }
    }
}

struct TimeTracker: View {
    @EnvironmentObject var appState: AppState
    @State var leftText: String = "0:00"
    @State var rightText: String = "0:00"
    @StateObject var localState: NowPlayingState
    
    @State var deltaLeftText: String = "0:00"
    @State var deltaRightText: String = "0:00"
    
    var body: some View {
        VStack {
            ZStack {
                GeometryReader { geometry in // geo reader is fucked
                    DiamondControll(nowPlayingState: localState, totalWidth: geometry.size.width)
                    if localState.seekState == .barProgress {
                        ProgressBar(totalWidth: geometry.size.width)
                    }
                    RoundedRectangle(cornerRadius: 12, style: .circular)
                        .stroke(Theme.colors.darkColor, lineWidth: 2)
                        .frame(width: nil, height: 12, alignment: .bottom)
                }
                .frame(height: 12)
            }
            HStack {
                Text( localState.seekState == .diamondScroll ? localState.deltaLeftText : leftText )
                Spacer()
                Text( localState.seekState == .diamondScroll ? localState.deltaRightText : rightText )
            }
            .onReceive(appState.timer) { time in
                leftText = appState.currentPlaybackString()
                rightText = appState.endPlaybackString()
            }
        }.onAppear {
            leftText = appState.currentPlaybackString()
            rightText = appState.endPlaybackString()
        }
    }
}

struct ProgressBar: View {
    
    var totalWidth: CGFloat
    @State var leftSpacing: CGFloat = 100
    @State var rightSpacing: CGFloat = 100
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        HStack(spacing: 0) {
            Rectangle()
                .fill(Theme.colors.darkColor)
                .frame(width: leftSpacing , height: 12, alignment: .bottom)
            Rectangle()
                .fill(Theme.colors.lightColor)
                .frame(width: rightSpacing , height: 12, alignment: .bottom)
        }
        .clipShape(RoundedRectangle(cornerRadius: 12, style: .circular))
        .onReceive(appState.timer) { time in
            leftSpacing = totalWidth * appState.songPlayedRatio()
            rightSpacing = totalWidth * appState.songPlayedRatio()
        }.onAppear {
            leftSpacing = totalWidth * appState.songPlayedRatio()
            rightSpacing = totalWidth * appState.songPlayedRatio()
        }
    }
}

struct DiamondControll: View {
    
    @State var leftSpacing: CGFloat = 0.5
    @State var rightSpacing: CGFloat = 0.5
    @EnvironmentObject var appState: AppState
    @StateObject var nowPlayingState: NowPlayingState
    
    @State var deltaLeftRatio: CGFloat = 0.25
    @State var deltaRightRatio: CGFloat = 0.75
    
    var totalWidth: CGFloat
    
    var body: some View {
        HStack(spacing: 0) {
            Spacer()
                .frame(width: nowPlayingState.seekState == .diamondScroll ? deltaLeftSpacing() : leftSpacing )
            Diamond()
                .fill( nowPlayingState.seekState == .barProgress ? Theme.colors.lightColor : Theme.colors.darkColor)
                .frame(width: 12, height: 12)
            Spacer()
                .frame(width: nowPlayingState.seekState == .diamondScroll ? deltaRightSpacing() : rightSpacing )
        }
        .onReceive(appState.timer) { time in
            leftSpacing = usableWidth() * leftRatio()
            rightSpacing = usableWidth() * rightRatio()
        }
    }
    
    func usableWidth() -> CGFloat {
        totalWidth - 12
    }
    
    func leftRatio() -> CGFloat {
        appState.songPlayedRatio()
    }
    
    func rightRatio() -> CGFloat {
        appState.songRemainingRatio()
    }
    
    func deltaLeftSpacing() -> CGFloat {
        return usableWidth() * nowPlayingState.deltaLeftRatio
    }
    
    func deltaRightSpacing() -> CGFloat {
        return usableWidth() * nowPlayingState.deltaRightRatio
    }
}
