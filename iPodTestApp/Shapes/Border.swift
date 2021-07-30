//
//  Border.swift
//  iPodTestApp
//
//  Created by TJ Littlejohn on 7/29/21.
//

import Foundation
import SwiftUI
import Combine

struct Border: Shape {
    
    let size: CGFloat
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let leftBorder = CGRect(x: 0, y: 0, width: size, height: rect.height)
        path.addRect(leftBorder)
        
        let rightBorder = CGRect(x: rect.width - size, y: 0, width: size, height: rect.height)
        path.addRect(rightBorder)
        
        let topBorder = CGRect(x: 0, y: 0, width: rect.width, height: size)
        path.addRect(topBorder)
        
        let bottomBorder = CGRect(x: 0, y: rect.height - size, width: rect.width, height: size)
        path.addRect(bottomBorder)
        
        return path
    }
}
