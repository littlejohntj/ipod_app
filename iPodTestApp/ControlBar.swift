//
//  ControlBar.swift
//  iPodTestApp
//
//  Created by TJ Littlejohn on 7/5/21.
//

import Foundation
import SwiftUI

struct ControlBarViewModel {
    var menuAction: () -> ()
}

struct ControlBar: View {
    var state: MyState
    var viewModel: ControlBarViewModel
    let buttonSize: CGFloat
    
    var body: some View {
        HStack {
            ControlButton(size: buttonSize) {
                Image(systemName: "backward.end.alt.fill")
                    .foregroundColor(Theme.colors.buttonTextColor)
            }
            Spacer()
            ControlButton( size: buttonSize) {
                Text("MENU")
                    .fontWeight(.bold)
                    .foregroundColor(Theme.colors.buttonTextColor)
            } action: {
                state.stateDismiss?()
            }

            Spacer()
            ControlButton(size: buttonSize) {
                Image(systemName: "playpause.fill")
                    .foregroundColor(Theme.colors.buttonTextColor)
            }
            Spacer()
            ControlButton(size: buttonSize) {
                Image(systemName: "forward.end.alt.fill")
                    .foregroundColor(Theme.colors.buttonTextColor)
            }
        }
    }
}

struct ControlBar_Previews: PreviewProvider {
    static var previews: some View {
        ControlBar(state: MyState(), viewModel: ControlBarViewModel(menuAction: {}), buttonSize: 80)
            .padding()
    }
}
