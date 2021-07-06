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
                    .foregroundColor(.red)
            }
            Spacer()
            ControlButton( size: buttonSize) {
                Text("MENU")
                    .font(.body)
                    .foregroundColor(.red)
            } action: {
                state.stateDismiss?()
            }

            Spacer()
            ControlButton(size: buttonSize) {
                Image(systemName: "playpause.fill")
                    .foregroundColor(.red)
            }
            Spacer()
            ControlButton(size: buttonSize) {
                Image(systemName: "forward.end.alt.fill")
                    .foregroundColor(.red)
            }
        }
    }
}

//struct ControlBar_Previews: PreviewProvider {
//    static var previews: some View {
//        ControlBar(viewModel: <#ControlBarViewModel#>)
//            .padding()
//    }
//}
