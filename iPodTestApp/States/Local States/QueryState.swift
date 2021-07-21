//
//  QueryState.swift
//  iPodTestApp
//
//  Created by TJ Littlejohn on 7/20/21.
//

import Foundation
import SwiftUI
import Combine

class QueryState: LocalState, ObservableObject {
    
    init ( title: String, items: [RowItem] ) {
        self.title = title
        self.items = items
    }
                       
    @Published var selected: Int = 0
    
    var title: String
    var items: [RowItem]
                       
    func up() {
        if selected < items.count - 1 {
           selected += 1
        }
    }

    func down() {
        if selected > 0 {
           selected -= 1
        }
    }

    class func items( for query: String ) -> [RowItem] {
        return [RowItem(name: query, arrow: true)]
    }

    class func stateFromQuery( query: String ) -> QueryState {
        let items = QueryState.items(for: query)
        return QueryState(title: query, items: items)
    }
    
    

}
