//
//  AppState.swift
//  iPodTestApp
//
//  Created by TJ Littlejohn on 7/20/21.
//

import Foundation
import Combine
import SwiftUI

class AppState: ObservableObject {
    
    init() {}
    
    @Published var backlight: Bool = true
    @Published var localState: LocalState?
    var stateDismiss: DismissAction?
        
    func up() {
        if let localState = self.localState {
            localState.up()
        }
    }
    
    func down() {
        if let localState = self.localState {
            localState.down()
        }
    }
    
    func setStateDismiss( dismiss: DismissAction ) {
        stateDismiss = dismiss
    }
    
    func setLocalState( localState: LocalState? ) {
        self.localState = localState
    }
    
    var colors: ColorTheme { backlight ? BacklightOnColorTheme() : BacklightOffColorTheme() }
    
}
