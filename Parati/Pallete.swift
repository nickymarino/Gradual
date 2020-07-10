//
//  PaletteSwitcher.swift
//  Parati
//
//  Created by Nicky Marino on 7/9/20.
//  Copyright © 2020 Nicky Marino. All rights reserved.
//

import SwiftUI

extension Color {
    static func random() -> Color {
        return Color(red: .random(in: 0...1),
                     green: .random(in: 0...1),
                     blue: .random(in: 0...1))
    }
}

struct Palette {
    var firstPrimary: Color
    var secondPrimary: Color
    var accent: Color
    
    func gradient() -> Gradient {
        return Gradient(colors: [firstPrimary, secondPrimary])
    }
}

class PaletteFactory {
    var predefinedPalettes: [Palette]?
    
    private var currentIndex: Int = 0
    private var lastIndex: Int? = nil
    
    func next() -> Palette {
        if predefinedPalettes != nil {
            return randomPredefinedPalette()
        }
        
        return Palette(firstPrimary: Color.random(), secondPrimary: Color.random(), accent: Color.random())
    }
    
    func randomPredefinedPalette() -> Palette {
        guard let palettes = predefinedPalettes else {
            fatalError("Cannot choose a predefined pallete from nil")
        }
        if (palettes.count > 1) && (lastIndex != nil) {
            // Keep drawing until the last used color isn't chosen
            repeat {
                currentIndex = palettes.indices.randomElement()!
            } while (currentIndex == lastIndex)
        } else {
            currentIndex = palettes.indices.randomElement()!
        }
        lastIndex = currentIndex
        return palettes[currentIndex]
    }
}

class PaletteSwitcher: ObservableObject {
    @Published var first = Palette(firstPrimary: Color(#colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)), secondPrimary: Color(#colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)), accent: Color(#colorLiteral(red: 0.5058823824, green: 0.3372549117, blue: 0.06666667014, alpha: 1)))
    @Published var second = Palette(firstPrimary: Color(#colorLiteral(red: 0.3098039329, green: 0.01568627544, blue: 0.1294117719, alpha: 1)), secondPrimary: Color(#colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)), accent: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)))
    @Published var useFirst = true

    private var factory = PaletteFactory()
    
    init() { }
    
    /// Freezes the switcher to use only one Palette
    /// - Parameter single: the gradient to be used
    init(single: Palette) {
        self.first = single
        self.second = single
        self.factory.predefinedPalettes = [single]
    }

    func rotate() {
        let palette = factory.next()

        useFirst.toggle()
        if useFirst {
            first = palette
        }
        else {
            second = palette
        }
    }
    
    func current() -> Palette {
        return useFirst ? first : second
    }
}
