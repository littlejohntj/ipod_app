//
//  NowPlayingView.swift
//  iPodTestApp
//
//  Created by TJ Littlejohn on 7/21/21.
//

import Foundation
import SwiftUI
import Combine

struct NowPlayingView: View {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var appState: AppState
    @StateObject var nowPlayingState: NowPlayingState = NowPlayingState()
    
    var body: some View {
        ZStack {
            Theme.colors.lightColor.edgesIgnoringSafeArea(.all)
            NowPlaying()
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
    var body: some View {
        VStack {
            HStack {
                Text("1 of 12")
                    .font(.custom("Chicago", size: 18))
                Spacer()
            }
            .padding(.leading, 10)
            Spacer()
            TrackInfoView()
            Spacer()
            TimeTracker()
                .padding([.leading, .trailing, .bottom], 10)
        }
        .font(.custom("Chicago", size: 22))
        .foregroundColor(Theme.colors.darkColor)
    }
}

struct TrackInfoView: View {
    var body: some View {
        VStack {
            Text("Vertigo")
            Text("U1")
            Text("How to Dismantle")
        }
        .padding(10)
    }
}

struct TimeTracker: View {
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 12, style: .circular)
                .frame(width: nil, height: 12, alignment: .bottom)
            HStack {
                Text("0:43")
                Spacer()
                Text("-2:43")
            }
        }
    }
}

struct NowPlaying_Preview: PreviewProvider {
    static var previews: some View {
        Group {
            NowPlaying()
                .previewDevice("iPhone 12 Pro")
        }
    }
}
