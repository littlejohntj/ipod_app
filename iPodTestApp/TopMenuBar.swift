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
    
    let darkBlue = Color(.displayP3, red: 51/255, green: 57/255, blue: 90/255, opacity: 1)
    
    var body: some View {
        Text("iPod")
            .font(.custom("Chicago", size: 18))
            .foregroundColor(darkBlue)
    }
}

struct Battery: View {
    
    let darkBlue = Color(.displayP3, red: 51/255, green: 57/255, blue: 90/255, opacity: 1)
    
    var body: some View {
        HStack {
            Spacer()
            Image(systemName: "battery.100")
                .padding()
                .foregroundColor(darkBlue)
        }
    }
}
