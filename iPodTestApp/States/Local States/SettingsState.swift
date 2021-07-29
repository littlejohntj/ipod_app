//
//  SettingsState.swift
//  iPodTestApp
//
//  Created by TJ Littlejohn on 7/21/21.
//

import Foundation
import SwiftUI
import Combine

class SettingsState: LocalState, ObservableObject {
    
    var onScreenItemCount: Int = 6
    var currentTop: Int = 0
    var currentBottom: Int = 5
    
    var title: String = "Settings"
    var proxy: ScrollViewProxy?
    @Published var selected: Int = 0
    @Published var navigate: Bool = false
    var items: [RowItem] =  [   RowItem(name: "About", arrow: true),
                                RowItem(name: "Main Menu", arrow: true),
                                RowItem(name: "Shuffle", arrow: true),
                                RowItem(name: "Repeat", arrow: true),
                                RowItem(name: "Backlight Timer", arrow: true),
                                RowItem(name: "EQ", arrow: true),
                                RowItem(name: "Sound Check", arrow: true),
                                RowItem(name: "Contrast", arrow: true),
                                RowItem(name: "Clicker", arrow: true),
                                RowItem(name: "Date & Time", arrow: true),
                                RowItem(name: "Contacts", arrow: true),
                                RowItem(name: "Languages", arrow: true),
                                RowItem(name: "Legal", arrow: true),
                                RowItem(name: "Reset All Settings", arrow: true),
                            ]
    
    func selfNavigate() {
        navigate = true
    }

}
