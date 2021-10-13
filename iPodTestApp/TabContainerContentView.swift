//
//  TabContainerContentView.swift
//  TabContainerContentView
//
//  Created by TJ Littlejohn on 8/9/21.
//

import Foundation
import SwiftUI

enum MusicSource: String, CaseIterable {
    case spotify = "Spotify"
    case apple = "Apple Music"
}

enum DeviceVersion: String, CaseIterable {
    case wheel = "Scroll Wheel"
    case dock = "Dock Connector"
    case click = "Click Wheel"
}

enum SkinColors: String, CaseIterable {
    case white = "White"
    case blue = "Blue"
    case purple = "Purple"
    case ape = "Bored Ape"
}

struct TabContainerContentView<Content: View>: View {
    
    @State var username: String = ""
    @State private var deviceIndex = 0
    @State private var musicIndex = 0
    @State private var colorIndex = 0
    var container: () -> Content
    @EnvironmentObject var appState: AppState
    
    
    var body: some View {
        TabView {
            ZStack {
                Color.black.ignoresSafeArea()
                NavigationView {
                    Form {
                        Section(header: Text("Music Source")) {
                            Picker(selection: $musicIndex, label: Text("Souce")) {
                                ForEach(0 ..< MusicSource.allCases.count) { index in
                                    Text(MusicSource.allCases[index].rawValue)
                                }
                            }
                        }
                        Section(header: Text("iPod Vesion")) {
                            Picker(selection: $deviceIndex, label: Text("iPod")) {
                                ForEach(0 ..< DeviceVersion.allCases.count) { index in
                                    Text(DeviceVersion.allCases[index].rawValue)
                                }
                            }
                        }
                        Section(header: Text("iPod Color")) {
                            Picker(selection: $appState.colorIndex, label: Text("Color")) {
                                ForEach(0 ..< SkinColors.allCases.count) { index in
                                    Text(SkinColors.allCases[index].rawValue)
                                }
                            }
                        }
                    }
                    .navigationBarTitle("Settings")
                }
                .navigationViewStyle(StackNavigationViewStyle())
            }
            container()
        }
        .tabViewStyle(PageTabViewStyle())
    }
}
