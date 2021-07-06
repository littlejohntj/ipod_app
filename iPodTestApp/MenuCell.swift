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
    
    let darkBlue = Color(.displayP3, red: 51/255, green: 57/255, blue: 90/255, opacity: 1)
    let lightBlue = Color(.displayP3, red: 186/255, green: 199/255, blue: 217/255, opacity: 1)
    
    var body: some View {
        ZStack {
            selected ? darkBlue.ignoresSafeArea() : lightBlue.ignoresSafeArea()
            HStack {
                Text(text)
                    .font(.custom("Chicago", size: 18))
                    .foregroundColor( selected ? lightBlue : darkBlue)
                    .padding()
                Spacer()
                if arrow { Image(systemName: "chevron.right").foregroundColor( selected ? lightBlue : darkBlue ).padding().font(.headline) }
            }.frame(height: 30)
        }
    }
}
