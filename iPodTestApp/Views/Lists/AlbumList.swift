//
//  AlbumList.swift
//  iPodTestApp
//
//  Created by TJ Littlejohn on 7/27/21.
//

import Foundation
import SwiftUI
import Combine

struct AlbumList: View {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var appState: AppState
    @StateObject var localState: AlbumState
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
                                
                                let selectedIndex = localState.selected
                                let selection = localState.items[selectedIndex]
                            
                                EmptyView()
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
        }
    }
}
