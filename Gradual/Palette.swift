//
//  Palette.swift
//  Gradual
//
//  Created by Nicky Marino on 9/24/20.
//  Copyright © 2020 Nicky Marino. All rights reserved.
//

import Foundation
import SwiftUI

class Palette: ObservableObject {
    @Published var colors = [Color.orange, Color.blue]

    init() {
        shuffle()
    }

    func shuffle() {
        let oldIndex = colorIndex
        repeat {
            colorIndex = Int.random(in: 0..<colorSets.count)
        } while (oldIndex == colorIndex)

        colors = colorSets[colorIndex]
    }

    // MARK: Private Implementation

    private var colorIndex = 0
    private var colorSets = [
        [Color.pink, Color.yellow],
        [Color.red, Color.purple],
        [Color.green, Color.white],
        [Color.purple, Color.black]
    ]

    private func newColor() -> [Color] {

        return colorSets[colorIndex]
    }
}
