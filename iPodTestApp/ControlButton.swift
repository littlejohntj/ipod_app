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
    
//    @EnvironmentObject var state: MyState
    var backlight: Bool = true
    let size: CGFloat
    var content: () -> Content
    var action: (() -> ())? = nil
    let secondaryColor = Color.Neumorphic.secondary
    
    var body: some View {
        ZStack {
            Button {
                action?()
            } label: {
                ZStack {
                    Circle().fill(mainColor).frame(width: size, height: size)
                        .softInnerShadow(Circle(), spread: 0.6)
                    
                    Circle().fill(Color.white).frame(width: size - 8, height: size - 8)
                        .softOuterShadow(offset: 2, radius: 3)
                    if backlight {
                        content()
                            .frame(width: size, height: size)
                            .multicolorGlow()
                    } else {
                        content()
                            .frame(width: size, height: size)
                    }
                }
            }
        }
    }
}

struct ControlButton_Preview: PreviewProvider {
    
    static var previews: some View {
        ZStack {
//            mainColor.edgesIgnoringSafeArea(.all)
            ControlButton(size: 120) {
                Text("MENU")
                    .font(.system(size: 20, weight: .black, design: .monospaced))
                    .foregroundColor(.red)
                    .multilineTextAlignment(.center)
            } action: {
                print("dfsaf")
            }

        }
    }
}
