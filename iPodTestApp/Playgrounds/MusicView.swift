//
//  MusicView.swift
//  iPodTestApp
//
//  Created by TJ Littlejohn on 7/5/21.
//

import Foundation
import SwiftUI
import MusicKit
import MediaPlayer

struct MusicView: View {
    var body: some View {
        Text("Hi")
        VStack {
            List {
                Text("sup")
                Text("dude")
            }
            Button("Auth") {
                async {
                    let status = await getAuth()
                    print(status)
                }
            }.padding()
            Button("Play") {
                SystemMusicPlayer.shared.play()
            }.padding()
            Button("Pause") {
                SystemMusicPlayer.shared.pause()
            }.padding()

            Button("Search") {
                let request = MusicCatalogSearchRequest(term: "Drake", types: [Album.self])

                async {
                    let response = try await request.response()
                    print(response)
                }
            }.padding()

            Button("Library Request") {
                print(artists())
            }.padding()
        }
    }
    
    func getAuth() async -> MusicAuthorization.Status {
        let status = await MusicAuthorization.request()
        return status
    }
    
    func playlists() -> [MPMediaItem]? {

        guard let playlists = MPMediaQuery.playlists().items else {
            return nil
        }

        let r = playlists.filter { $0.mediaType == MPMediaType.music }

        print( r.map { $0.title } )

        return playlists.filter { $0.mediaType == MPMediaType.music }
    }
    
    func artists() -> [MPMediaItem]? {

        guard let artists = MPMediaQuery.artists().items else {
            return nil
        }

        print( artists.map { $0.albumArtist } )

        return artists
    }
    
}

struct MusicView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MusicView()
        }
    }
}
