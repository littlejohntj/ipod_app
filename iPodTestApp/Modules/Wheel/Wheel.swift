//
//  Wheel.swift
//  iPodTestApp
//
//  Created by TJ Littlejohn on 7/5/21.
//

import Foundation
import SwiftUI

struct Wheel: View {
    
    @EnvironmentObject var state: AppState
    var wheelButton:() -> ()
    var spaceingDistance: CGFloat = 100
    static let shift: CGFloat = 0.3
    
    let num: CGFloat = 110
    let size: CGFloat = 320
    
    @State var prev: CGFloat = -1 * shift
    @State var current: CGFloat = 0
    @State var next:CGFloat = Wheel.shift
    
    var body: some View {
        ZStack {
            Circle().fill(Color.white).frame(width: size, height: size)
                .softInnerShadow(Circle(), spread: 0.6)

            Circle().fill(Color.white).frame(width: size - 8, height: size - 8)
                .softOuterShadow(offset: 2, radius: 3)
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
                .frame(width: size - 20, height: size - 20, alignment: .center)
            Circle().fill(Color.white).frame(width: num, height: num)
                .softInnerShadow(Circle(), spread: 0.6)

            Circle().fill(Color.white).frame(width: num - 8, height: num - 8)
                .softOuterShadow(offset: 2, radius: 3)
            Button(action: {
                wheelButton()
            }, label: {
                Text("")
                    .frame(width: num * 0.75, height: num * 0.75, alignment: .center)
                    .clipShape(Circle())
            })
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
//
//struct Wheel_Previews: PreviewProvider {
//    static var previews: some View {
//        Wheel(state: MyState(), wheelButton: {})
////        Wheel(wheelButton: {})
//            .padding()
//    }
//}
