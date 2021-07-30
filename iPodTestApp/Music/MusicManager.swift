//
//  MusicManager.swift
//  iPodTestApp
//
//  Created by TJ Littlejohn on 7/23/21.
//

import Foundation
import MusicKit
import MediaPlayer

struct MusicManager {
    
    static func artists() -> [String] {

        guard let artists = MPMediaQuery.artists().items else {
            return ["fuck"]
        }
        let artistNames = artists.compactMap { $0.artist }
        let uniqueArtistNames = Set(artistNames)
        return uniqueArtistNames.sorted()
    }
    
//    static func musicFromAlbum( album: MPMediaItem ) -> [MPMediaItem] {
//
//    }
    
    static func musicFromGenre( genre: String ) -> [MPMediaItem] {
        return MPMediaQuery.songs().items?.filter({ song in
            if let title = song.title ,song.genre == genre {
                return true
            }
            return false
        }) ?? [MPMediaItem]()
    }
    
    static func musicFromComposer( composers: String ) -> [MPMediaItem] {
        return MPMediaQuery.songs().items?.filter({ song in
            if let title = song.title ,song.genre == composers {
                return true
            }
            return false
        }) ?? [MPMediaItem]()
    }
    
    static func musicFromArtist( artist: String ) -> [MPMediaItem] {
        return MPMediaQuery.songs().items?.filter({ song in
            if let title = song.title ,song.artist == artist {
                return true
            }
            return false
        }) ?? [MPMediaItem]()
    }
    
    static func musicFromAlbum( album: String ) -> [MPMediaItem] {
        return MPMediaQuery.songs().items?.filter({ song in
            if let title = song.title ,song.albumTitle == album {
                return true
            }
            return false
        }) ?? [MPMediaItem]()
    }
    
    static func allMusic() -> [MPMediaItem] {
        guard let songs = MPMediaQuery.songs().items else {
            return [MPMediaItem]()
        }
        
        return songs.filter { song in
            guard song.title != nil else {
                return false
            }
            
            guard song.albumTitle != nil else {
                return false
            }
            
            guard song.artist != nil else {
                return false
            }
            
            guard song.genre != nil else {
                return false
            }
            
            return true
        }
    }
    
    static func allAlbums() -> [MPMediaItem] {
        guard let albums = MPMediaQuery.albums().items else {
            return [MPMediaItem]()
        }
        
        return albums
    }
    
    static func allAlbumTitles() -> [String] {
        guard let albums = MPMediaQuery.albums().items else {
            return [String]()
        }
        
        return Set(albums.compactMap { $0.albumTitle }).sorted()
    }
    
    static func allGenres() -> [String] {
        guard let albums = MPMediaQuery.songs().items else {
            return [String]()
        }
        
        return Set(albums.compactMap { $0.genre }).sorted()
    }
    
    static func allComposers() -> [String] {
        guard let composers = MPMediaQuery.songs().items else {
            return [String]()
        }
        
        return Set(composers.compactMap { $0.composer }).sorted()
    }
    
    
    static func allArtists() -> [MPMediaItem] {
        guard let artists = MPMediaQuery.artists().items else {
            return [MPMediaItem]()
        }
        
        return artists
    }
    
    static func allArtistAlbums( artist: String ) -> [String] {
        
        guard let songs = MPMediaQuery.songs().items else {
            return [String]()
        }
        
        let artistSongs = songs.filter { $0.artist == artist }
        
        
        return Set(artistSongs.compactMap { $0.albumTitle }).sorted()
        
//        return albums.filter { $0.artist == artist }
    }
    
    static func allPlaylists() -> [MPMediaItem] {
        guard let playlists = MPMediaQuery.playlists().collections else {
            return [MPMediaItem]()
        }
        
        for playlist in playlists {
            print( playlist.items.count )
        }
        
        return [MPMediaItem]()
    }
        
}

struct PodPlaylist {
    let item: MPMediaItem
    let title: String
}
