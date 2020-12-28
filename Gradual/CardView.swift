//
//  CardView.swift
//  Gradual
//
//  Created by Nicky Marino on 8/2/20.
//  Copyright © 2020 Nicky Marino. All rights reserved.
//

import SwiftUI

struct CardView: View {
    /// The image to be shared
    @Binding var image: UIImage
    /// Toggled by a Gradient view when `image` is ready to be shared
    @Binding var showShareSheet: Bool
    /// Toggle to start an image capture
    @Binding var captureGradient: Bool

    /// Tells whether the view is currently in a tap animation
    @State private var isTapped = false
    /// Toggle for showing either the first palette or the second
    @State private var showFirstGradient = true

    /// Palettes that set the color gradients
    @ObservedObject private var firstPalette = Palette()
    @ObservedObject private var secondPalette = Palette()

    func swapGradients() {
        // Hide the old gradient
        self.showFirstGradient.toggle()
        print(self.showFirstGradient)

        // Shuffle the palette for the newly hidden gradient
        let palette = !self.showFirstGradient ? self.firstPalette : self.secondPalette
        palette.shuffle()
    }

    var body: some View {
        ZStack {
            // SwiftUI can't animate changes in a LinearGradient (yet), so use two
            // gradients and switch between them with an opacity animation
            GradientView(colors: $firstPalette.colors, image: $image, showShareSheet: $showShareSheet, captureGradient: $captureGradient)
                .opacity(showFirstGradient ? 0 : 1)
            
            GradientView(colors: $secondPalette.colors, image: $image, showShareSheet: $showShareSheet, captureGradient: $captureGradient)
                .opacity(showFirstGradient ? 1 : 0)
        }
        .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .shadow(color: (showFirstGradient ? firstPalette.colors[0] : secondPalette.colors[0]).opacity(0.1), radius: 5, x: 2, y: 2)
        .animation(.easeOut)
        .scaleEffect(isTapped ? 1.05 : 1)
        .animation(.spring(response: 0.5, dampingFraction: 0.5, blendDuration: 0))
        .onTapGesture {
            self.isTapped = true
            self.swapGradients()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                self.isTapped = false
            }
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(image: .constant(UIImage()), showShareSheet: .constant(false), captureGradient: .constant(false))
            .padding()
    }
}
