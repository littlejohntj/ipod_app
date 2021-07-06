//
//  ContentView.swift
//  iPodTestApp
//
//  Created by TJ Littlejohn on 7/2/21.
//

import SwiftUI
import MusicKit
import MediaPlayer

struct ContentView: View {
    
    @StateObject var state: MyState
    var controlBarViewModel = ControlBarViewModel {
        
    }
    
    var body: some View {
        
        ZStack {
            
            VStack {
                Screen(width: 350) {
                    ContentList(state: state)
                }
                ControlBar(state: state, viewModel: controlBarViewModel, buttonSize: 80)
                    .frame(height: 80)
                    .padding()
                Wheel(state: state, wheelButton: {
                    state.select?()
                })
                    .padding()
            }
        }
        .onAppear {
            for family in UIFont.familyNames.sorted() {
                let names = UIFont.fontNames(forFamilyName: family)
                print("Family: \(family) Font names: \(names)")
            }
        }
    }
}

struct ContentList: View {
    
    @Environment(\.dismiss) var dismiss
    @StateObject var state: MyState
    let lightBlue = Color(.displayP3, red: 186/255, green: 199/255, blue: 217/255, opacity: 1)
    
    var body: some View {
            ZStack {
                lightBlue.edgesIgnoringSafeArea(.all)
                List {
                    ForEach(state.items.indices, id: \.self) { index in
                        
                        ZStack {
                            MenuCell(text: state.items[index].name, selected: state.selected == index, arrow: state.items[index].arrow)
                            NavigationLink(destination: ContentList(state: state)) {
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
                state.stateDismiss = dismiss
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView(state: MyState())
                .previewDevice("Mac")
        }
    }
}
