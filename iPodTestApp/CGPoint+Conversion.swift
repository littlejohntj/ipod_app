//
//  CGPoint+Conversion.swift
//  iPodTestApp
//
//  Created by TJ Littlejohn on 7/4/21.
//

import Foundation
import SwiftUI

extension CGPoint {

    func convert(to coordinateSpace: CGPoint) -> CGPoint {
        applying(CGAffineTransform(translationX: -coordinateSpace.x,
                                   y: -coordinateSpace.y))
    }

    var angle: Angle {
        var angle = atan(y / x) * 180 / .pi
        angle = (x < 0 && y < 0) ? angle + 180 : angle
        angle = angle < 0 ? (y < 0 ? 360 + angle : 180 + angle) : angle
        return .init(degrees: Double(angle))
    }

}
