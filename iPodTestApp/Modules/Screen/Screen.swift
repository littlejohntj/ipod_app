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
                    VStack {
                        TopMenuBar()
                            .frame(height: 15).padding([.top, .trailing], 10)
                        Rectangle()
                            .fill( Theme.colors.darkColor )
                            .frame(height: 2)
                        NavigationView {
                            container()
                            .navigationBarTitle("")
                            .navigationBarHidden(true)
                        }
                    }
                }.frame(width: blueWidth, height: blueHeight)
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
    }
}

struct Screen_Previews: PreviewProvider {
    static var previews: some View {
        ScreenView()
            .previewDevice("iPhone 12 Pro")
    }
}
