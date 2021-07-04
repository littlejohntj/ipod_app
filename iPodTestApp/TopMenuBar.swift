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
    }
}

struct Battery: View {
    var body: some View {
        HStack {
            Spacer()
            Image(systemName: "battery.100")
                .padding()
        }
    }
}
