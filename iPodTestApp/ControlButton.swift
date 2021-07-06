//
//  ControlButton.swift
//  iPodTestApp
//
//  Created by TJ Littlejohn on 7/5/21.
//

import Foundation
import SwiftUI
import Neumorphic

private let mainColor = Color.Neumorphic.main

struct ControlButton<Content>: View where Content: View {
    let size: CGFloat
    var content: () -> Content
    var action: (() -> ())? = nil
//    let mainColor = Color.Neumorphic.main
    let secondaryColor = Color.Neumorphic.secondary
    
    
    var body: some View {
        ZStack {
            Button {
                action?()
            } label: {
                ZStack {
                    Circle().fill(mainColor).frame(width: size, height: size)
                        .softInnerShadow(Circle(), spread: 0.6)
                    
                    Circle().fill(mainColor).frame(width: size - 10, height: size - 10)
                        .softOuterShadow(offset: 2, radius: 1)
                    content()
                }
            }
        }
    }
}

struct ControlButton_Preview: PreviewProvider {
    
    static var previews: some View {
        ZStack {
            mainColor.edgesIgnoringSafeArea(.all)
            ControlButton(size: 120) {
                Text("LOL")
            } action: {
                print("dfsaf")
            }

        }
    }
}
