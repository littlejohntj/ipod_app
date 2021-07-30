//
//  Screen.swift
//  iPodTestApp
//
//  Created by TJ Littlejohn on 7/5/21.
//

import Foundation
import SwiftUI

struct Screen<Content>: View where Content: View {
    
    var width: CGFloat
    var container: () -> Content
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        
        let aspectRatio: CGFloat = 111.0 / 135.0
        
        let blackWidth: CGFloat = width
        let blackHeight: CGFloat = blackWidth * aspectRatio
        
        let blackWhiteDelta: CGFloat = 10
        let whiteBlueDelta: CGFloat = 7
        
        let whiteWidth: CGFloat = blackWidth - blackWhiteDelta
        let whiteHeight: CGFloat = blackHeight - blackWhiteDelta
        
        let blueWidth: CGFloat = whiteWidth - whiteBlueDelta
        let blueHeight: CGFloat = whiteHeight - whiteBlueDelta
        
            ZStack {
                RoundedRectangle(cornerRadius: 13)
                    .fill(Color.black)
                    .frame(width: blackWidth, height: blackHeight, alignment: .center)
                RoundedRectangle(cornerRadius: 4)
                    .fill( Theme.colors.backgroundColor )
                    .frame(width: whiteWidth, height: whiteHeight, alignment: .center)
                ZStack {
                    Rectangle()
                        .fill( Theme.colors.lightColor )
                        .frame(width: blueWidth, height: blueHeight, alignment: .center)
                    VStack( spacing: 0 ) {
                        TopMenuBar()
                            .frame(height: 33).padding([.top], 4)
                        Rectangle()
                            .fill( Theme.colors.darkColor )
                            .frame(height: 2.5)
                        Spacer()
                            .frame(height: 2)
                        NavigationView {
                            ZStack {
                                Theme.colors.lightColor.ignoresSafeArea()
                                HStack(spacing: 2) {
                                    container()
                                        .navigationBarTitle("")
                                        .navigationBarHidden(true)
                                    if appState.shouldShowScrollBar() {
                                        ScrollBar()
                                            .frame(width: 15)
                                    }
                                }
                            }
                            
                        }
                        .navigationViewStyle(StackNavigationViewStyle())
                    }
                }.frame(width: blueWidth, height: blueHeight)
            }
    }
}

struct ScrollBar: View {
    
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        GeometryReader { rect in
            ZStack {
                Theme.colors.lightColor.ignoresSafeArea()
                Border(size: 2)
                    .foregroundColor(Theme.colors.darkColor)
                VStack(spacing: 0) {
                    Rectangle()
                        .foregroundColor(Theme.colors.lightColor)
                        .frame(width: 8,
//                               height: (rect.size.height - 6) / 3.0 ,
                               height: appState.aRatio() * ( rect.size.height - 8 ) ,
                               alignment: .center)
                    Rectangle()
                        .foregroundColor(Theme.colors.darkColor)
                        .frame(width: 8,
//                               height: (rect.size.height - 6) / 3.0,
                               height: appState.bRatio() * ( rect.size.height - 8 ),
                               alignment: .center)
                    Rectangle()
                        .foregroundColor(Theme.colors.lightColor)
                        .frame(width: 8,
//                               height: (rect.size.height - 6) / 3.0 ,
                               height: appState.cRatio() * ( rect.size.height - 8 ),
                               alignment: .center)
                }
            }
        }
    }
    
}

struct ScreenView: View {
    var body: some View {
        ZStack {
            Color.gray.ignoresSafeArea()
            Screen(width: 300) {
                Text("Yoo :)")
            }
        }.frame(width: 500, height: 500, alignment: .center)
            .environmentObject(AppState())
    }
}

struct Screen_Previews: PreviewProvider {
    static var previews: some View {
        ScreenView()
            .previewDevice("iPhone 12 Pro")
    }
}
