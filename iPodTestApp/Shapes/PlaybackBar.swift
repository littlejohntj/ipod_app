//
//  PlaybackBar.swift
//  iPodTestApp
//
//  Created by TJ Littlejohn on 7/25/21.
//

import Foundation
import SwiftUI

struct PlaybackBar: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        var curve = 0.1
        
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        return path
    }
}

//struct PlaybackView: View {
//    var trim: CGFloat
//    
//    var body: some View {
////        PlaybackBar()
////            .trim(from: 0, to: 0.2)
////            .frame(width: 300, height: 75, alignment: .center)
//        
//    }
//}
//
//struct Playback_Preview: PreviewProvider {
//
//    static var previews: some View {
//        PlaybackView(trim: 0.6)
//
//    }
//}
