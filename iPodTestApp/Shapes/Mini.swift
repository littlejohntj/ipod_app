//
//  Mini.swift
//  Mini
//
//  Created by TJ Littlejohn on 8/10/21.
//

import Foundation
import SwiftUI

struct Mini: Shape {
    
    let delta: CGFloat = 0.01
    
    func path(in rect: CGRect) -> Path {
        
        let bigDelta: CGFloat = 1 - self.delta
        let smallDelta: CGFloat = delta
        
        var path = Path()
        
        path.move(to: CGPoint(x: rect.maxX * smallDelta , y: rect.minY))
        
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY * smallDelta))
        
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY * bigDelta))
        
        path.addLine(to: CGPoint(x: rect.maxX * smallDelta, y: rect.maxY))
        
        path.addLine(to: CGPoint(x: rect.maxX * bigDelta, y: rect.maxY))
        
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY * bigDelta))
        
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY * smallDelta))
        
        path.addLine(to: CGPoint(x: rect.maxX * bigDelta, y: rect.minY))
        
        path.addLine(to: CGPoint(x: rect.maxX * smallDelta , y: rect.minY))
        
        return path
    }
}

struct MiniView: View {
    
    var body: some View {
        Mini()
            .fill( Color.purple )
    }
}

struct Mini_Preview: PreviewProvider {
    
    static var previews: some View {
        Group {
            MiniView()
        }
    }
    
}
