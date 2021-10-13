//
//  QueryState.swift
//  iPodTestApp
//
//  Created by TJ Littlejohn on 7/20/21.
//

import Foundation
import SwiftUI
import Combine

class QueryState: LocalState, ObservableObject {
    
    var onScreenItemCount: Int = 6
    var currentTop: Int = 0
    var currentBottom: Int = 5
    
    init ( title: String, items: [RowItem], queue: [String]? = nil ) {
        self.title = title
        self.items = items
        self.queue = queue
    }
    
    var queue: [String]?
                       
    var appState: AppState?
    @Published var selected: Int = 0
    @Published var navigate: Bool = false
    var proxy: ScrollViewProxy?
    
    var title: String
    var items: [RowItem]

    class func items( for query: String ) -> [RowItem] {
        let all = MusicManager.artists()
        return all.map { RowItem(name: $0, arrow: true) }
    }
    
    class func songItemsForArtist( _ query: String ) -> [RowItem] {
        let all = MusicManager.musicFromArtist(artist: query)
        return all.map { RowItem(name: $0.title!, arrow: true, song: $0) }
    }
    
    class func songItemsForAlbum( _ query: String ) -> [RowItem] {
        let all = MusicManager.musicFromAlbum(album: query)
        return all.map { RowItem(name: $0.title!, arrow: true, song: $0) }
    }
    
    class func songItemsForGenre( _ query: String ) -> [RowItem] {
        let all = MusicManager.musicFromGenre(genre: query)
        return all.map { RowItem(name: $0.title!, arrow: true, song: $0) }
    }
    
    class func songItemsForComposer( _ query: String ) -> [RowItem] {
        let all = MusicManager.musicFromComposer(composers: query)
        return all.map { RowItem(name: $0.title!, arrow: true, song: $0) }
    }


    class func stateFromQuery( query: String ) -> QueryState {
        
        switch query {
        case "Songs":
            let items = QueryState.allSongs()
            return QueryState(title: "All Songs", items: items)
        case "Albums":
            let items = QueryState.allAlbums()
            return QueryState(title: "All Albums", items: items)
        case "Playlist":
            let items = QueryState.allPlaylists()
            return QueryState(title: "All Playlists", items: items)
        case "Artists":
            let items = QueryState.allArtists()
            return QueryState(title: "All Artists", items: items)
        case "Genres":
            let items = QueryState.allGenres()
            return QueryState(title: "All Genres", items: items)
        case "Composers":
            let items = QueryState.allComposers()
            return QueryState(title: "All Composers", items: items)
        default:
            let items = QueryState.items(for: query)
            return QueryState(title: query, items: items)
        }
        
    }
    
    class func songStateFromAlbum( query: String ) -> QueryState {
        var items = QueryState.songItemsForAlbum(query)
        items.sort { lhs, rhs in
            
            return lhs.song!.albumTrackNumber < rhs.song!.albumTrackNumber
            
        }
        return QueryState(title: query, items: items)
    }
    
    class func songStateFromArtist( query: String ) -> QueryState {
        let items = QueryState.songItemsForArtist(query)
        return QueryState(title: query, items: items)
    }
    
    class func songStateFromGenre( query: String ) -> QueryState {
        let items = QueryState.songItemsForGenre(query)
        return QueryState(title: query, items: items)
    }
    
    class func songStateFromComposer( query: String ) -> QueryState {
        let items = QueryState.songItemsForComposer(query)
        return QueryState(title: query, items: items)
    }
    
    class func allSongs() -> [RowItem] {
        let all = MusicManager.allMusic()
        return all.map { RowItem(name: $0.title!, arrow: true, song: $0) }
    }
    
    class func allAlbums() -> [RowItem] {
        let all = MusicManager.allAlbumTitles()
        return all.map { RowItem(name: $0, arrow: true) }
    }
    
    class func allGenres() -> [RowItem] {
        let all = MusicManager.allGenres()
        return all.map { RowItem(name: $0, arrow: true) }
    }
    
    class func allComposers() -> [RowItem] {
        let all = MusicManager.allComposers()
        return all.map { RowItem(name: $0, arrow: true) }
    }
    
    class func allPlaylists() -> [RowItem] {
        let all = MusicManager.allPlaylists()
        return all.map { RowItem(name: $0.title!, arrow: true) }
    }
    
    class func allArtists() -> [RowItem] {
        let all = MusicManager.artists()
        return all.map {
            RowItem(name: $0, arrow: true)
        }
    }
    
    func selfNavigate() {
        
        let selection = items[selected]
        
//        navigate = true
//        appState?.playSong(item: selection.song!)
        
        if let song = selection.song {

            if let currentSongId = appState?.currentSong()?.playbackStoreID, currentSongId == song.playbackStoreID {
                navigate = true
            } else {
//                appState?.currentSong = song
                navigate = true
                appState?.playQueue(queue: (items[selected...] + items[..<selected]).compactMap { $0.song?.playbackStoreID })
            }
        } else {
            navigate = true
        }
        
        
        
    }
}
