//
//  iPodTestAppApp.swift
//  iPodTestApp
//
//  Created by TJ Littlejohn on 7/2/21.
//

import SwiftUI
import MusicKit
import MediaPlayer

@main
struct iPodTestAppApp: App {
    
//    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var state = AppState()
    var pages: [Int] = [0, 1]
    
    
    init () {
        Theme.appState = state
    }
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                Color.black.ignoresSafeArea()
                TabContainerContentView {
                    ContentView()
                }
                .environmentObject(state)
            }
//            MusicView()
//            MiniView()
//                .frame(width: 330, height: 600, alignment: .center)
//            SpotifyView()
        }
    }
}

//class AppDelegate: UIResponder, UIApplicationDelegate, SPTAppRemoteDelegate, SPTAppRemotePlayerStateDelegate {
//
//    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
//        print("Your code here")
//        return true
//    }
//
//    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
//      let parameters = appRemote.authorizationParameters(from: url);
//
//            if let access_token = parameters?[SPTAppRemoteAccessTokenKey] {
//                appRemote.connectionParameters.accessToken = access_token
//                self.accessToken = access_token
//            } else if let error_description = parameters?[SPTAppRemoteErrorDescriptionKey] {
//                // Show the error
//            }
//      return true
//    }
//
//    func appRemoteDidEstablishConnection(_ appRemote: SPTAppRemote) {
//      print("connected")
//    }
//    func appRemote(_ appRemote: SPTAppRemote, didDisconnectWithError error: Error?) {
//      print("disconnected")
//    }
//    func appRemote(_ appRemote: SPTAppRemote, didFailConnectionAttemptWithError error: Error?) {
//      print("failed")
//    }
//    func playerStateDidChange(_ playerState: SPTAppRemotePlayerState) {
//      print("player state changed")
//    }
//
//}
