//
//  Stem.swift
//  iPodTestApp
//
//  Created by TJ Littlejohn on 8/5/21.
//

import Foundation
import SwiftUI

//struct Stem: Shape {
//    func path(in rect: CGRect) -> Path {
//        var path = Path()
//
//        path.addrou
//
//        return path
//    }
//
//
//}
//
//struct StemView: View {
//    var body: some View {
//        Stem()
//    }
//}


struct Stem_Preview: PreviewProvider {

    static var previews: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            Capsule()
                .fill(Color.white)
                .frame(width: 150, height: 700)
                .innerShadow(using: Capsule(), angle: Angle(degrees: -5), color: Color.gray, width: 80, blur: 70)
        }
        
//        .previewDevice("iPad Pro (11-inch) (3rd generation)")
//.previewInterfaceOrientation(.landscapeRight)
        

    }
}
