//
//  TopMenuBar.swift
//  iPodTestApp
//
//  Created by TJ Littlejohn on 7/2/21.
//

import Foundation
import SwiftUI

struct TopMenuBar: View {
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        VStack {
            ZStack {
                iPodTitle()
                    .padding([.leading, .trailing], 50)
                Battery()
                    .padding(.trailing, 8)
                PlaybackState()
                    .padding(.leading, 8)
            }
        }
    }
}

struct iPodTitle: View {
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        Text(appState.title)
            .font(.custom("Chicago", size: 22))
            .foregroundColor( Theme.colors.darkColor )
            .frame(width: .infinity, height: 22, alignment: .center)
    }
}

struct Battery: View {
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        HStack {
            Spacer()
            BatteryView(color: Theme.colors.darkColor, percentage: .four, lineWidth: 2)
                .frame(width: 36, height: 18, alignment: .center)
        }
    }
}

struct PlaybackState: View {
    @EnvironmentObject var appState: AppState
    @State var isPlaying: Bool = false
    
    var body: some View {
        HStack {
            Image(systemName: isPlaying ? "play.fill" : "pause.fill")
                .foregroundColor(Theme.colors.darkColor)
                .frame(width: 36, height: 18, alignment: .center)
            Spacer()
        }
        .onReceive(appState.playbackTimer) { _ in
            isPlaying = appState.isPlaying
        }
    }
}

struct TopBar_Preview: PreviewProvider {
    
    static var previews: some View {
        TopMenuBar()
    }
}
