//
//  SpinnableViewModifier.swift
//  iPodTestApp
//
//  Created by TJ Littlejohn on 7/4/21.
//

import Foundation
import SwiftUI

extension View {
    func spinnable(onChanged: ((Rotation) -> Void)? = nil, onEnded: ((Rotation) -> Void)? = nil) -> some View {
        self.modifier(SpinnableViewModifier(onChanged: onChanged,
                                            onEnded: onEnded))
    }
}

struct SpinnableViewModifier: ViewModifier {

    fileprivate var onChanged: ((Rotation) -> Void)?
    fileprivate var onEnded: ((Rotation) -> Void)?

    @State private var rotation: Rotation = .none
    @State private var finishedSpinning = false

    func body(content: Content) -> some View {
        GeometryReader { geometry in
            content
                .gesture(
                    DragGesture()
                        .onChanged({ (value) in
                            guard !self.finishedSpinning else { return }

                            let location = value.location.convert(to: CGPoint(x: geometry.size.width / 2,
                                                                              y: geometry.size.height / 2))
                                                                              
                            self.rotation = self.rotation.addNewEntry(angle: location.angle, time: value.time)
                            self.onChanged?(self.rotation)
                        }).onEnded({ value in
                            self.onEnded?(self.rotation)
                            self.rotation = .none
                            self.finishedSpinning = false
                        })
            )
        }
    }

}
