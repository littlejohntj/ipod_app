//
//  ContentView.swift
//  iPodTestApp
//
//  Created by TJ Littlejohn on 7/2/21.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var state: MyState

    var body: some View {
        ZStack {
            iPodHID(state: state)
        }.environmentObject(state)
    }
}

struct iPodHID: View {
    
    @StateObject var state: MyState
    var controlBarViewModel = ControlBarViewModel {
        
    }
    
    var body: some View {
        VStack {
            Screen(width: 340) {
                ContentList(state: state)
            }
            .frame(width: 340, height: 290, alignment: .center)
            ControlBar(state: state, viewModel: controlBarViewModel, buttonSize: 90)
                .frame(width: 420, height: 90, alignment: .center)
                .padding()
            Wheel(state: state, wheelButton: {
//                state.select?
//                print("tru")
            })
                .frame(width: 340, height: 340, alignment: .top)
                
        }
        .frame(width: 420, height: 760, alignment: .center)
    }
}

struct ContentList: View {
    
    @Environment(\.dismiss) var dismiss
    @StateObject var state: MyState
    var body: some View {
            ZStack {
                Theme.colors.lightColor.edgesIgnoringSafeArea(.all)
                List {
                    ForEach(state.items.indices, id: \.self) { index in
                        
                        ZStack {
                            MenuCell(text: state.items[index].name, selected: state.selected == index, arrow: state.items[index].arrow)
                            NavigationLink(destination: ContentList(state: state.items[index].state ?? state )) {
                                EmptyView()
                            }
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
                state.setStateDismiss(dismiss: dismiss)
                print("cunt")
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView(state: MyState())
                .previewDevice("iPhone 12 Pro Max")
        }
    }
}
