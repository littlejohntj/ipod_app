//
//  RowItem.swift
//  iPodTestApp
//
//  Created by TJ Littlejohn on 7/20/21.
//

import Foundation
import SwiftUI
import Combine

enum RowItemAccessory {
    case arrow
    case toggle
    case none
}

struct RowItem {
    
    init(name: String, arrow: Bool)  {
        self.name = name
        self.arrow = arrow
    }
    
    let id = UUID()
    let name: String
    let arrow: Bool
}
