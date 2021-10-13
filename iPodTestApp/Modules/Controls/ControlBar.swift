//
//  ControlBar.swift
//  iPodTestApp
//
//  Created by TJ Littlejohn on 7/5/21.
//

import Foundation
import SwiftUI
import UIKit

struct ControlBarViewModel {
    var menuAction: () -> ()
}

struct ControlBar: View {
    @EnvironmentObject var state: AppState
    var viewModel: ControlBarViewModel
    let buttonSize: CGFloat
    
    var body: some View {
        HStack {
            ControlButton(size: buttonSize) {
                Image(systemName: "backward.end.alt.fill")
                    .foregroundColor(Theme.colors.buttonTextColor)
            } action: {
                UIDevice.lightHaptic()
                state.backwardsSong()
            }
            Spacer()
            ControlButton( size: buttonSize) {
                Text("MENU")
                    .fontWeight(.bold)
                    .foregroundColor(Theme.colors.buttonTextColor)
            } action: {
                UIDevice.lightHaptic()
                state.stateDismiss?()
            }
            Spacer()
            ControlButton(size: buttonSize) {
                Image(systemName: "playpause.fill")
                    .foregroundColor(Theme.colors.buttonTextColor)
            } action: {
                UIDevice.lightHaptic()
                async {
                    await state.playPause()
                }
            }
            Spacer()
            ControlButton(size: buttonSize) {
                Image(systemName: "forward.end.alt.fill")
                    .foregroundColor(Theme.colors.buttonTextColor)
            } action: {
                UIDevice.lightHaptic()
                state.fowardSong()
            }
        }
    }
}
//
//struct ControlBar_Previews: PreviewProvider {
//    static var previews: some View {
////        ControlBar(state: MyState(), viewModel: ControlBarViewModel(menuAction: {}), buttonSize: 80)
////            .padding()
//    }
//}
