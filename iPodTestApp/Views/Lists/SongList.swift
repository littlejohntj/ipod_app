//
//  SongList.swift
//  iPodTestApp
//
//  Created by TJ Littlejohn on 7/24/21.
//

import Foundation
import SwiftUI
import Combine

struct SongList: View {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var appState: AppState
    @StateObject var localState: QueryState
    
    var body: some View {
        ZStack {
            Theme.colors.lightColor.edgesIgnoringSafeArea(.all)
            ScrollViewReader { proxy in
                List {
                    ForEach(localState.items.indices, id: \.self) { index in
                        
                        ZStack {
                            MenuCell(text: localState.items[index].name,
                                     selected: localState.selected == index,
                                     arrow: localState.items[index].arrow)
                            NavigationLink(isActive: $localState.navigate ) {
                                QueryList(localState: QueryState.songStateFromArtist(query: localState.items[localState.selected].name) )
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
                appState.setStateDismiss(dismiss: dismiss)
                appState.setLocalState(localState: localState)
            }
        }
    }
    
}
