//
//  Theme.swift
//  iPodTestApp
//
//  Created by TJ Littlejohn on 7/19/21.
//

import Foundation
import SwiftUI

struct Theme {
    static var colors: ColorTheme {
        if let backlight = appState?.backlight {
            return backlight ? onTheme : offTheme
        }
        
        return offTheme
    }
    static var appState: AppState?
    static var onTheme: ColorTheme = BacklightOnColorTheme()
    static var offTheme: ColorTheme = BacklightOffColorTheme()
}

protocol ColorTheme {
    var backgroundColor: Color { get }
    var darkColor: Color { get }
    var lightColor: Color { get }
    var buttonTextColor: Color { get }
}

struct BacklightOnColorTheme: ColorTheme {
    
    var buttonTextColor = Color.red
    var backgroundColor = Color(.displayP3, red: 222/255, green: 234/255, blue: 251/255, opacity: 1)
    var darkColor = Color(.displayP3, red: 51/255, green: 57/255, blue: 90/255, opacity: 1)
    var lightColor = Color(.displayP3, red: 186/255, green: 199/255, blue: 217/255, opacity: 1)
}

struct BacklightOffColorTheme: ColorTheme {
    var buttonTextColor = Color.gray
    var backgroundColor = Color(.displayP3, red: 94/255, green: 93/255, blue: 77/255, opacity: 1)
    var darkColor = Color(.displayP3, red: 26/255, green: 22/255, blue: 16/255, opacity: 1)
    var lightColor = Color(.displayP3, red: 78/255, green: 79/255, blue: 60/255, opacity: 1)
}
