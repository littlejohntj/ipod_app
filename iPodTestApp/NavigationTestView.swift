//
//  NavigationTestView.swift
//  iPodTestApp
//
//  Created by TJ Littlejohn on 7/5/21.
//

import Foundation
import SwiftUI

struct NavView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink {
                    Text("SUCK ME")
                } label: {
                    Text("SIDEWAYS")
                }

                Text("yooo")
                Text("hehehehe")
            }
        }
    }
}

struct Nav_Preview: PreviewProvider {
    static var previews: some View {
        Group {
            NavView()
        }
    }

}
