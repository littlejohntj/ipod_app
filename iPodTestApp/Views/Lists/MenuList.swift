//
//  MenuList.swift
//  iPodTestApp
//
//  Created by TJ Littlejohn on 7/21/21.
//

import Foundation
import SwiftUI
import Combine

struct MenuList: View {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var appState: AppState
    @StateObject var menuState: MenuState = MenuState()
    var body: some View {
        ZStack {
            Theme.colors.lightColor.edgesIgnoringSafeArea(.all)
            ScrollViewReader { proxy in
                List {
                    ForEach(menuState.items.indices, id: \.self) { index in
                        ZStack {
                            MenuCell(text: menuState.items[index].name,
                                     selected: menuState.selected == index,
                                     arrow: menuState.items[index].arrow)
                            NavigationLink(isActive: $menuState.navigate ) {
                                switch menuState.selected {
                                case 0:
                                    MusicList()
                                case 2:
                                    SettingsList()
                                case 4:
                                    SettingsList()
                                default:
                                    Text("FUCK YOU")
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
                    menuState.proxy = proxy
                })
                .listStyle(.plain)
                .environment(\.defaultMinListRowHeight, 40)
                .navigationBarTitle("")
                .navigationBarHidden(true)
            }
        }.onAppear {
            appState.prepareToPlay()
            menuState.appState = appState
            appState.setStateDismiss(dismiss: dismiss)
            appState.setLocalState(localState: menuState)
        }
    }
}
