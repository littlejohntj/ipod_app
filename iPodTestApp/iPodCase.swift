//
//  iPodCase.swift
//  iPodTestApp
//
//  Created by TJ Littlejohn on 7/5/21.
//

import Foundation
import SwiftUI

struct iPodCase<Content>: View where Content : View {
    
    let cornerRadius: CGFloat = 50
    
    var content: () -> Content
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: cornerRadius)
                .fill(Color.white)
                .frame(width: 498, height: 839)
                .innerShadow(using: RoundedRectangle(cornerRadius: cornerRadius))
            content()
                .frame(width: 300, height: 500, alignment: .center)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct iPodCase_Preview: PreviewProvider {
    static var previews: some View {
        Group {
            ZStack {
                Color.black.edgesIgnoringSafeArea(.all)
                iPodCase {
                    Text("")
                }
                iPodHID()
                    .environmentObject(AppState())
            }
            .previewDevice("iPad Pro (11-inch) (3rd generation)")
        }
    }
}

extension View {
    func innerShadow<S: Shape>(using shape: S, angle: Angle = .degrees(0), color: Color = .black, width: CGFloat = 6, blur: CGFloat = 6) -> some View {
        
        let finalX = CGFloat(cos(angle.radians - .pi / 2))
        let finalY = CGFloat(sin(angle.radians - .pi / 2))
        
        return self
            .overlay(
                    shape
                        .stroke(color, lineWidth: width)
                        .offset(x: finalX * width * 0.6, y: finalY * width * 0.6)
                        .blur(radius: blur)
                        .mask(shape)
                )
    }
}
