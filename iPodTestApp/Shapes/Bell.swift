//
//  Bell.swift
//  iPodTestApp
//
//  Created by TJ Littlejohn on 8/4/21.
//

import Foundation
import SwiftUI

struct Bell: Shape {
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let c1 = CGPoint(x: rect.minX, y: rect.maxY * 0.25)
        let c2 = CGPoint(x: rect.maxX * 0.25, y: rect.minY)
        
        let x1 = CGPoint(x: rect.maxX, y: rect.maxY * 0.25)
        let x2 = CGPoint(x: rect.maxX * 0.75, y: rect.minY)
        
        let j1 = CGPoint(x: rect.maxX, y: rect.maxY)
        let j2 = CGPoint(x: rect.maxX, y: rect.maxY)
        
        let t1 = CGPoint(x: rect.minX, y: rect.maxY)
        let t2 = CGPoint(x: rect.minX, y: rect.maxY)
        
        path.move(to: CGPoint(x: rect.minX, y: rect.maxY * 0.9))
        
        path.addCurve(to: CGPoint(x: rect.midX, y: rect.minY), control1: c1, control2: c2)
        path.addCurve(to: CGPoint(x: rect.maxX, y: rect.maxY * 0.9), control1: x2, control2: x1)
        
        path.addCurve(to: CGPoint(x: rect.maxX * 0.9, y: rect.maxY), control1: j1, control2: j2)
        path.addLine(to: CGPoint(x: rect.maxX * 0.1, y: rect.maxY))
        
        path.addCurve(to: CGPoint(x: rect.minX, y: rect.maxY * 0.9), control1: t1, control2: t2)
        
//        path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
//        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        
        return path
    }
    
    
}

struct BellView: View {
    
    var darkColor = Color(.displayP3, red: 51/255, green: 57/255, blue: 90/255, opacity: 1)
    var lightColor = Color(.displayP3, red: 186/255, green: 199/255, blue: 217/255, opacity: 1)
    var backgroundColor = Color(.displayP3, red: 222/255, green: 234/255, blue: 251/255, opacity: 1)
    
    var outterSize: CGFloat = 500
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 50) {
                Bell()
                    .fill(Color.purple)
                    .frame(width: 220, height: 110, alignment: .center)
                    .innerShadow(using: Bell())
                    .rotationEffect(Angle(degrees: -30))
                    .transformEffect(CGAffineTransform(translationX: -80, y: 50))
                Bell()
                    .fill(Color.white)
                    .frame(width: 220, height: 110, alignment: .center)
                    .innerShadow(using: Bell())
                    .rotationEffect(Angle(degrees: 30))
                    .transformEffect(CGAffineTransform(translationX: 80, y: 50))
            }
            ZStack {
                Circle()
                    .fill(Color.white)
                    .frame(width: 600, height: 600, alignment: .center)
                    .innerShadow(using: Circle())
                    .padding()
                Circle()
                    .fill(Color.black)
                    .frame(width: outterSize - 30, height: outterSize - 30, alignment: .center)
                Circle()
                    .fill(backgroundColor)
                    .frame(width: outterSize - 40, height: outterSize - 40, alignment: .center)
                Circle()
                    .fill(lightColor)
                    .frame(width: outterSize - 50, height: outterSize - 50, alignment: .center)
                    
                
            }
            
                
        }
        
    }
}



struct Playback_Preview: PreviewProvider {

    static var previews: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            BellView()
        }
        .previewDevice("iPad Pro (11-inch) (3rd generation)")
.previewInterfaceOrientation(.landscapeRight)
        

    }
}
