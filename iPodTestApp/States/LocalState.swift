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
    
    var proxy: ScrollViewProxy? { get set }
    
    mutating func up()
    mutating func down()
    func selfNavigate()
    
    var onScreenItemCount: Int { get set }
    var currentTop: Int { get set }
    var currentBottom: Int { get set }
}

extension LocalState {

    mutating func up() {
        if selected < items.count - 1 {
           selected += 1
        }

        if let proxy = proxy {

            if selected > currentBottom {
                currentBottom += 1
                currentTop += 1
                proxy.scrollTo(currentBottom, anchor: .bottom)
            }
        }
    }

    mutating func down() {
        if selected > 0 {
           selected -= 1
        }

        if let proxy = proxy {
            if selected < currentTop {
                currentTop -= 1
                currentBottom -= 1
                proxy.scrollTo(selected, anchor: .top)
            }
        }
    }

    
}


