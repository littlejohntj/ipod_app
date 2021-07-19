//
//  MenuCell.swift
//  iPodTestApp
//
//  Created by TJ Littlejohn on 7/5/21.
//

import Foundation
import SwiftUI

struct MenuCellViewModel {
    
    var state: MyState
    var index: Int
    
    var text: String { state.items[index].name }
    var selected: Bool { state.selected == index }
    var arrow: Bool { state.items[index].arrow }
    
}

struct MenuCell: View {
    var text: String
    var selected: Bool
    var arrow: Bool
        
    var body: some View {
        ZStack {
            selected ? Theme.colors.darkColor.ignoresSafeArea() : Theme.colors.lightColor.ignoresSafeArea()
            HStack {
                Text(text)
                    .font(.custom("Chicago", size: 22))
                    .foregroundColor( selected ? Theme.colors.lightColor : Theme.colors.darkColor)
                    .padding()
                Spacer()
                if arrow {
                    ArrowShape()
                        .fill(selected ? Theme.colors.lightColor : Theme.colors.darkColor)
                        .frame(width: 10, height: 16, alignment: .trailing)
                        .padding([.trailing], 10)
                }
            }.frame(height: 30)
        }
    }
}
