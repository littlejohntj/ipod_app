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
            List {
                ForEach(localState.items.indices, id: \.self) { index in
                    
                    ZStack {
                        MenuCell(text: localState.items[index].name,
                                 selected: localState.selected == index,
                                 arrow: localState.items[index].arrow)
//                        NavigationLink(destination: {
//                            Text(musicState.items[index].name)
//                        }, label: {
//                            EmptyView()
//                        })
//                        .frame(width: 0, height: 0)
//                        .hidden()
                    }
                    .listRowInsets(EdgeInsets())
                    .listRowSeparator(.hidden)
                    
                }
            }
            .listStyle(.plain)
            .environment(\.defaultMinListRowHeight, 40)
            .navigationBarTitle("")
            .navigationBarHidden(true)
        }.onAppear {
            appState.setStateDismiss(dismiss: dismiss)
            appState.setLocalState(localState: localState)
        }
    }
}
