//
//  Ring.swift
//  iPodTestApp
//
//  Created by TJ Littlejohn on 7/5/21.
//

import Foundation
import SwiftUI

struct Ring: Shape {
    
    var ratio: CGFloat

    func path(in rect: CGRect) -> Path {
        let radius = min(rect.width, rect.height) / 2
        let center = CGPoint(x: rect.width / 2,
                             y: rect.height / 2)
        var path = Path()
        path.addArc(center: center,
                    radius: radius,
                    startAngle: .zero,
                    endAngle: .init(radians: .pi * 2),
                    clockwise: true)

        path.addArc(center: center,
                    radius: radius * ratio,
                    startAngle: .zero,
                    endAngle: .init(radians: .pi * 2),
                    clockwise: false)

        return path
    }
}
