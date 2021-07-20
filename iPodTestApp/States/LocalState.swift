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
    
    func up()
    func down()
}
