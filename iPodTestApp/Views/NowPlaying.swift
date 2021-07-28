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
            appState.setStateDismiss(dismiss: dismiss)
            appState.setLocalState(localState: nowPlayingState)
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

struct NowPlaying: View {
    @EnvironmentObject var appState: AppState
    @StateObject var nowPlayingState: NowPlayingState
    var body: some View {
        VStack {
            HStack {
                Text("\(appState.currentSong!.albumTrackNumber) of \(appState.currentSong!.albumTrackCount)")
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
        .font(.custom("Chicago", size: 22))
        .foregroundColor(Theme.colors.darkColor)
    }
}

struct TrackInfoView: View {
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        VStack {
            Text(appState.currentSong!.title!)

            Text(appState.currentSong!.artist!)
            Text(appState.currentSong!.albumTitle!)
        }
        .padding(10)
    }
}

struct TimeTracker: View {
    @EnvironmentObject var appState: AppState
    @State var leftText: String = "0:00"
    @State var rightText: String = "0:00"
    @StateObject var localState: NowPlayingState
    
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 12, style: .circular)
                    .stroke(Theme.colors.darkColor, lineWidth: 2)
                    .frame(width: nil, height: 12, alignment: .bottom)
                if localState.seekMode {
                    EmptyView()
                } else {
                    RoundedRectangle(cornerRadius: 12, style: .circular)
                        .fill(Theme.colors.darkColor)
                        .frame(width: nil, height: 12, alignment: .bottom)
                }
            }
            HStack {
                Text(leftText)
                Spacer()
                Text(rightText)
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

//struct NowPlaying_Preview: PreviewProvider {
//    static var previews: some View {
//        Group {
//            NowPlaying(song: <#T##MPMediaItem#>)
//                .previewDevice("iPhone 12 Pro")
//        }
//    }
//}
