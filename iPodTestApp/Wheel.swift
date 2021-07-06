//
//  Wheel.swift
//  iPodTestApp
//
//  Created by TJ Littlejohn on 7/5/21.
//

import Foundation
import SwiftUI

struct Wheel: View {
    
    var state: MyState
    var wheelButton:() -> ()
    var spaceingDistance: CGFloat = 100
    static let shift: CGFloat = 0.2
    
    let num: CGFloat = 160
    
    @State var prev: CGFloat = -1 * shift
    @State var current: CGFloat = 0
    @State var next:CGFloat = Wheel.shift
    
    var body: some View {
        ZStack {
            ZStack {
                Button(action: {
                    wheelButton()
                }, label: {
                    Text("")
                        .frame(width: num * 0.75, height: num * 0.75, alignment: .center)
                        .clipShape(Circle())
                })
                Ring(ratio: 0.4)
                    .fill(Color.white)
                    .spinnable(onChanged: { (rotation) in
                        if rotation.laps > next {
                            previousItem()
                        } else if rotation.laps < prev {
                            nextItem()
                        }
                    }, onEnded: { rotation in
                        // pass I think
                })
            }
            Ring(ratio: 0.985)
                .fill(Color.gray)
            Ring(ratio: 0.97)
                .fill(Color.gray)
                .frame(width: num, height: num, alignment: .center)
        }
        
    }
    
    func previousItem() {
        prev = current
        current = next
        next = next + Wheel.shift
        state.up()
    }
    
    func nextItem() {
        next = current
        current = prev
        prev = prev - Wheel.shift
        state.down()
    }
}

struct Wheel_Previews: PreviewProvider {
    static var previews: some View {
        Wheel(state: MyState(), wheelButton: {})
            .padding()
    }
}
