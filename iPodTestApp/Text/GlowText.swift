//
//  GlowText.swift
//  iPodTestApp
//
//  Created by TJ Littlejohn on 7/5/21.
//

import Foundation
import SwiftUI

struct GlowText: View {
    
    var text: String
    var glow: Bool = true
    
    var body: some View {
        Text(text)
            .font(.system(size: 20, weight: .black, design: .monospaced))
            .foregroundColor( Theme.colors.buttonTextColor )
            .multilineTextAlignment(.center)
            .multicolorGlow()
    }
    
}

struct GlowText_Preview: PreviewProvider {
    static var previews: some View {
        Group {
            ZStack {
                Color.black.ignoresSafeArea()
                GlowText(text: "MENU")
            }
        }
    }
}

extension View {
    func glow(color: Color = .red, radius: CGFloat = 20) -> some View {
        self
            .overlay(self.blur(radius: radius / 6))
            .shadow(color: color, radius: radius / 3)
            .shadow(color: color, radius: radius / 3)
            .shadow(color: color, radius: radius / 3)
    }
}

extension View {
    func multicolorGlow() -> some View {
        ZStack {
            ForEach(0..<2) { i in
                Rectangle()
                    .fill(AngularGradient(gradient: Gradient(colors: [.red, .red, .red, .red, .red, .red]), center: .center))
                    .mask(self.blur(radius: 1))
                    .overlay(self.blur(radius: 5 - CGFloat(i * 5)))
            }
        }
    }
}
