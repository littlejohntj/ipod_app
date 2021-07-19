//
//  Arrow.swift
//  iPodTestApp
//
//  Created by TJ Littlejohn on 7/19/21.
//

import Foundation
import SwiftUI

struct ArrowShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        var insetXDistance: CGFloat = 0.3
        var insetYDistance: CGFloat = 0.2
        var insetMiddleXDistance: CGFloat = 0.45
        
        path.move(to: CGPoint(x: rect.maxX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.maxX * insetXDistance, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY * insetYDistance))
        path.addLine(to: CGPoint(x: rect.maxX * insetMiddleXDistance, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY * (1 - insetYDistance)))
        path.addLine(to: CGPoint(x: rect.maxX * insetXDistance, y: rect.maxY))
        path.addLine(to:  CGPoint(x: rect.maxX, y: rect.midY))
        
        return path
    }
}

struct ArrowView: View {
    var body: some View {
        ArrowShape()
            .fill(Color.black)
            .frame(width: 100, height: 160, alignment: .center)
    }
}

struct Arrow_Preview: PreviewProvider {
    
    static var previews: some View {
        ArrowView()
    }
}
