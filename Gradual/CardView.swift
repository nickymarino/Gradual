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
    
    @State private var isTapped = false
    @State private var showTopGradient = true
    @State private var colorIndex = 0
    @State private var colorSets = [
        [Color.pink, Color.yellow],
        [Color.red, Color.purple],
        [Color.green, Color.white],
        [Color.purple, Color.black]
    ]
    @State private var topColors = [Color.orange, Color.blue]
    @State private var bottomColors = [Color.yellow, Color.green]
    
    func newColor() -> [Color] {
        colorIndex = (colorIndex + 1) % colorSets.count
        print(colorIndex)
        return colorSets[colorIndex]
    }
    
    func setNextColors() {
        let set = newColor()
        if showTopGradient {
            bottomColors = set
        } else {
            topColors = set
        }
    }
    
    var body: some View {
        ZStack {
            // SwiftUI can't animate changes in a LinearGradient (yet), so use two
            // gradients and switch between them with an opacity animation
            GradientView(colors: $topColors, image: $image, showShareSheet: $showShareSheet, captureGradient: $captureGradient)
                .opacity(showTopGradient ? 0 : 1)
            
            GradientView(colors: $bottomColors, image: $image, showShareSheet: $showShareSheet, captureGradient: $captureGradient)
                .opacity(showTopGradient ? 1 : 0)
        }
        .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .shadow(color: (showTopGradient ? topColors[0] : bottomColors[0]).opacity(0.1), radius: 5, x: 2, y: 2)
        .animation(.easeOut)
        .scaleEffect(isTapped ? 1.05 : 1)
        .animation(.spring(response: 0.5, dampingFraction: 0.5, blendDuration: 0))
        .onTapGesture {
            self.showTopGradient = !self.showTopGradient
            self.isTapped = true
            self.setNextColors()
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
