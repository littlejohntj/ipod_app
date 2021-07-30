//
//  SettingsList.swift
//  iPodTestApp
//
//  Created by TJ Littlejohn on 7/21/21.
//

import Foundation
import  SwiftUI
import Combine

struct SettingsList: View {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var appState: AppState
    @StateObject var settingsState: SettingsState = SettingsState()
    var body: some View {
        ZStack {
            Theme.colors.lightColor.edgesIgnoringSafeArea(.all)
            ScrollViewReader { proxy in
                List {
                    ForEach(settingsState.items.indices, id: \.self) { index in
                        ZStack {
                            MenuCell(text: settingsState.items[index].name,
                                     selected: settingsState.selected == index,
                                     arrow: settingsState.items[index].arrow)
//                            NavigationLink(destination: {
//    //                            Text(musicState.items[index].name)
//                                QueryList(localState: QueryState.stateFromQuery(query: musicState.items[index].name))
//                            }, label: {
//                                EmptyView()
//                            })
//                            .frame(width: 0, height: 0)
//                            .hidden()
                        }
                        .listRowInsets(EdgeInsets())
                        .listRowSeparator(.hidden)
                        
                    }
                }
                .onAppear(perform: {
                    settingsState.proxy = proxy
                })
                .listStyle(.plain)
                .environment(\.defaultMinListRowHeight, 35)
                .navigationBarTitle("")
                .navigationBarHidden(true)
            }
        }.onAppear {
            appState.title = settingsState.title
            appState.setStateDismiss(dismiss: dismiss)
            appState.setLocalState(localState: settingsState)
        }
    }
}
