//
//  QueryList.swift
//  iPodTestApp
//
//  Created by TJ Littlejohn on 7/21/21.
//

import Foundation
import SwiftUI
import Combine

struct QueryList: View {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var appState: AppState
    @StateObject var localState: QueryState
    var body: some View {
        
        
        ZStack {
            Theme.colors.lightColor.edgesIgnoringSafeArea(.all)
            HStack(spacing: 2) {
                ScrollViewReader { proxy in
                    List {
                        ForEach(localState.items.indices, id: \.self) { index in
                            
                            ZStack {
                                MenuCell(text: localState.items[index].name,
                                         selected: localState.selected == index,
                                         arrow: localState.items[index].arrow)
                                NavigationLink(isActive: $localState.navigate ) {
                                    
                                    let selectedIndex = localState.selected
                                    let selection = localState.items[selectedIndex]
                                    
                                    if let song = selection.song {
                                        NowPlayingView(song: song)
                                    } else {
                                        if localState.title == "All Artists" {
                                            ArtistList(localState: ArtistState.stateForArtist(artist: selection.name))
                                        } else if localState.title == "All Albums" {
                                            QueryList(localState: QueryState.songStateFromAlbum(query: selection.name))
                                        } else if localState.title == "All Genres" {
                                            QueryList(localState: QueryState.songStateFromGenre(query: selection.name))
                                        } else if localState.title == "All Composers" {
                                            QueryList(localState: QueryState.songStateFromComposer(query: selection.name))
                                        }
                                    }
                                } label: {
                                    EmptyView()
                                }
                                .frame(width: 0, height: 0)
                                .hidden()
                                
                            }
                            .listRowInsets(EdgeInsets())
                            .listRowSeparator(.hidden)
                            
                        }
                    }
                    .onAppear(perform: {
                        localState.proxy = proxy
                    })
                    .listStyle(.plain)
                    .environment(\.defaultMinListRowHeight, 35)
                    .navigationBarTitle("")
                    .navigationBarHidden(true)
                }.onAppear {
                    appState.title = localState.title
                    localState.appState = appState
                    appState.setStateDismiss(dismiss: dismiss)
                    appState.setLocalState(localState: localState)
                }
                if appState.shouldShowScrollBar() {
                    ScrollBar()
                        .frame(width: 15)
                }
            }
        }
    }
}
