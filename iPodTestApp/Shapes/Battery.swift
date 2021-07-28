//
//  Battery.swift
//  iPodTestApp
//
//  Created by TJ Littlejohn on 7/5/21.
//

import Foundation
import SwiftUI

struct BatteryView: View {
    
    enum BatteryPercentage: Int, Comparable {
        static func < (lhs: BatteryView.BatteryPercentage, rhs: BatteryView.BatteryPercentage) -> Bool {
            lhs.rawValue < rhs.rawValue
        }
        
        case one
        case two
        case three
        case four
    }
    
    let color: Color
    let percentage: BatteryPercentage
    let lineWidth: CGFloat
    
    var body: some View {
        ZStack {
            BatteryShape()
                .stroke(color, style: StrokeStyle(lineWidth: lineWidth, lineCap: .round, lineJoin: .bevel))
            BarShape(x: 0.08)
                .fill(color)
            if percentage > .one {
                BarShape(x: 0.28)
                    .fill(color)
            }
            if percentage > .two {
                BarShape(x: 0.48)
                    .fill(color)
            }
            if percentage > .three {
                BarShape(x: 0.68)
                    .fill(color)
            }
        }
    }
}

struct BatteryShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        var adjustmentA = 0.2
        var adjustmentB = 0.9
        
        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX * adjustmentB, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX * adjustmentB, y: (0.5 + adjustmentA) * rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: (0.5 + adjustmentA) * rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: (0.5 - adjustmentA) * rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX * adjustmentB, y: (0.5 - adjustmentA) * rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX * adjustmentB, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))

        return path
    }
}

struct BarShape: Shape {
    
    let x: CGFloat
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let mixX = rect.maxX * (x)
        let maxX = rect.maxX * (x + 0.14)
        
        let mixY = rect.maxY * 0.14
        let maxY = rect.maxY * 0.86
        
        path.move(to: CGPoint(x: mixX, y: mixY))
        path.addLine(to: CGPoint(x: mixX, y: maxY))
        path.addLine(to: CGPoint(x: maxX, y: maxY))
        path.addLine(to: CGPoint(x: maxX, y: mixY))
        path.addLine(to: CGPoint(x: mixX, y: mixY))
    
        return path
    }
}

struct BatteryTestView: View {
    
    @State private var speed = 50.0
    
    var body: some View {
        VStack {
            BatteryView(color: Color.black, percentage: covert(v: speed), lineWidth: 5)
                .frame(width: 200, height: 100, alignment: .center)
            Slider(
                value: $speed,
                in: 0...100
            ).padding()
                .frame(width: 200, height: 100, alignment: .center)
        }
    }
    
    func covert( v: CGFloat ) -> BatteryView.BatteryPercentage {
        
        if v < 25 {
            return .one
        } else if v < 50 {
            return .two
        } else if v < 75 {
            return .three
        } else {
            return .four
        }
        
    }
}


struct Battery_Preview: PreviewProvider {
    
    static var previews: some View {
        BatteryTestView()
            .frame(width: 100, height: 50, alignment: .center)
    }
}
