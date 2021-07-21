//
//  MusicList.swift
//  iPodTestApp
//
//  Created by TJ Littlejohn on 7/21/21.
//

import Foundation
import SwiftUI
import Combine

struct MusicList: View {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var appState: AppState
    @StateObject var musicState: MusicState = MusicState()
    var body: some View {
        ZStack {
            Theme.colors.lightColor.edgesIgnoringSafeArea(.all)
            ScrollViewReader { proxy in
                List {
                    ForEach(musicState.items.indices, id: \.self) { index in
                        ZStack {
                            MenuCell(text: musicState.items[index].name,
                                     selected: musicState.selected == index,
                                     arrow: musicState.items[index].arrow)
                            NavigationLink(destination: {
    //                            Text(musicState.items[index].name)
                                QueryList(localState: QueryState.stateFromQuery(query: musicState.items[index].name))
                            }, label: {
                                EmptyView()
                            })
                            .frame(width: 0, height: 0)
                            .hidden()
                        }
                        .listRowInsets(EdgeInsets())
                        .listRowSeparator(.hidden)
                        
                    }
                }
                .onAppear(perform: {
                    musicState.proxy = proxy
                })
                .listStyle(.plain)
                .environment(\.defaultMinListRowHeight, 40)
                .navigationBarTitle("")
                .navigationBarHidden(true)
            }
        }.onAppear {
            appState.setStateDismiss(dismiss: dismiss)
            appState.setLocalState(localState: musicState)
        }
    }
}
