//
//  CardView.swift
//  Parati
//
//  Created by Nicky Marino on 7/9/20.
//  Copyright © 2020 Nicky Marino. All rights reserved.
//

import SwiftUI

struct CardView: View {
    @ObservedObject var palettes: PaletteSwitcher
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(LinearGradient(gradient: self.palettes.first.gradient(), startPoint: UnitPoint(x: 0, y: 0), endPoint: UnitPoint(x: 1, y: 1)))
                .opacity(self.palettes.useFirst ? 1 : 0)
            Rectangle()
                .fill(LinearGradient(gradient: self.palettes.second.gradient(), startPoint: UnitPoint(x: 0, y: 0), endPoint: UnitPoint(x: 1, y: 1)))
                .opacity(self.palettes.useFirst ? 0 : 1)
        }
        .animation(.easeInOut)
    }
}

func haptic(type: UINotificationFeedbackGenerator.FeedbackType) {
    UINotificationFeedbackGenerator().notificationOccurred(type)
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(palettes: PaletteSwitcher(single: Palette(firstPrimary: .red, secondPrimary: .orange, accent: .white)))
    }
}
