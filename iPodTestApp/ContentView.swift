//
//  ContentView.swift
//  iPodTestApp
//
//  Created by TJ Littlejohn on 7/2/21.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var state: AppState

    var body: some View {
        ZStack {
            iPodHID()
        }.environmentObject(state)
    }
}

struct iPodHID: View {
    
    @EnvironmentObject var appState: AppState
    var controlBarViewModel = ControlBarViewModel {
        
    }
    
    var body: some View {
        VStack {
            Screen(width: 340) {
                ContentList()
            }
            .frame(width: 340, height: 290, alignment: .center)
            ControlBar(viewModel: controlBarViewModel, buttonSize: 90)
                .frame(width: 420, height: 90, alignment: .center)
                .padding()
            Wheel {
                appState.backlight.toggle()
            }
            .frame(width: 340, height: 340, alignment: .top)
                
        }
        .frame(width: 420, height: 760, alignment: .center)
    }
}

struct ContentList: View {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var appState: AppState
    @StateObject var menuState: MenuState = MenuState()
    var body: some View {
            ZStack {
                Theme.colors.lightColor.edgesIgnoringSafeArea(.all)
                List {
                    ForEach(menuState.items.indices, id: \.self) { index in
                        
                        ZStack {
                            MenuCell(text: menuState.items[index].name,
                                     selected: menuState.selected == index,
                                     arrow: menuState.items[index].arrow)
                            NavigationLink(destination: {
                                
                                switch menuState.selected {
                                case 0:
                                    MusicList()
                                default:
                                    Text("FUCK YOU")
                                }
                                
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
                .listStyle(.plain)
                .environment(\.defaultMinListRowHeight, 40)
                .navigationBarTitle("")
                .navigationBarHidden(true)
            }.onAppear {
                appState.setStateDismiss(dismiss: dismiss)
                appState.setLocalState(localState: menuState)
            }
    }
}

struct MusicList: View {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var appState: AppState
    @StateObject var musicState: MusicState = MusicState()
    var body: some View {
        ZStack {
            Theme.colors.lightColor.edgesIgnoringSafeArea(.all)
            List {
                ForEach(musicState.items.indices, id: \.self) { index in
                    
                    ZStack {
                        MenuCell(text: musicState.items[index].name,
                                 selected: musicState.selected == index,
                                 arrow: musicState.items[index].arrow)
                        NavigationLink(destination: {
                            Text(musicState.items[index].name)
                            switch musicState.selected {
                            case 0:
                                Text(musicState.items[index].name)
                            default:
                                Text("FUCK ME")
                            }
                            
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
            .listStyle(.plain)
            .environment(\.defaultMinListRowHeight, 40)
            .navigationBarTitle("")
            .navigationBarHidden(true)
        }.onAppear {
            appState.setStateDismiss(dismiss: dismiss)
            appState.setLocalState(localState: musicState)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView(state: AppState())
                .previewDevice("iPhone 12 Pro Max")
        }
    }
}
