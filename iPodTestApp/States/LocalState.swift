//
//  LocalState.swift
//  iPodTestApp
//
//  Created by TJ Littlejohn on 7/20/21.
//

import Foundation
import SwiftUI
import Combine

protocol LocalState {
    var items: [RowItem] { get }
    var selected: Int { get set }
    var title: String { get }
    var navigate: Bool { get set }
    
    func up()
    func down()
    func selfNavigate()
}


