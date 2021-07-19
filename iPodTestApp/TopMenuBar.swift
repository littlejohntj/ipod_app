//
//  TopMenuBar.swift
//  iPodTestApp
//
//  Created by TJ Littlejohn on 7/2/21.
//

import Foundation
import SwiftUI

struct TopMenuBar: View {
    var body: some View {
        ZStack {
            iPodTitle()
            Battery()
        }
    }
}

struct iPodTitle: View {
    var body: some View {
        Text("iPod")
            .font(.custom("Chicago", size: 22))
            .foregroundColor( Theme.colors.darkColor )
    }
}

struct Battery: View {
    var body: some View {
        HStack {
            Spacer()
            BatteryView(color: Theme.colors.darkColor, percentage: .four, lineWidth: 2)
                .frame(width: 36, height: 18, alignment: .center)
        }
    }
}

struct TopBar_Preview: PreviewProvider {
    
    static var previews: some View {
        TopMenuBar()
    }
}
