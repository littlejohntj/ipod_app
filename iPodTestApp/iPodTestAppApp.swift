//
//  iPodTestAppApp.swift
//  iPodTestApp
//
//  Created by TJ Littlejohn on 7/2/21.
//

import SwiftUI

@main
struct iPodTestAppApp: App {
    
    var state = AppState()
    
    
    init () {
        Theme.appState = state
    }
    
    var body: some Scene {
        WindowGroup {
//            ZStack {
//                Color.black.ignoresSafeArea()
//                BellView()
//            }
            ContentView(state: state)
//            MusicView()
        }
    }
}
