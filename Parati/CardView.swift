//
//  CardView.swift
//  Parati
//
//  Created by Nicky Marino on 7/9/20.
//  Copyright © 2020 Nicky Marino. All rights reserved.
//

import SwiftUI

struct CardView: View {
    @ObservedObject var gradients: GradientSwitcher
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(LinearGradient(gradient: Gradient(colors: self.gradients.first), startPoint: UnitPoint(x: 0, y: 0), endPoint: UnitPoint(x: 1, y: 1)))
                .opacity(self.gradients.useFirst ? 1 : 0)
            Rectangle()
                .fill(LinearGradient(gradient: Gradient(colors: self.gradients.second), startPoint: UnitPoint(x: 0, y: 0), endPoint: UnitPoint(x: 1, y: 1)))
                .opacity(self.gradients.useFirst ? 0 : 1)
        }
        .animation(.easeInOut)
    }
}

func haptic(type: UINotificationFeedbackGenerator.FeedbackType) {
    UINotificationFeedbackGenerator().notificationOccurred(type)
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(gradients: GradientSwitcher(gradient: [.red, .orange]))
    }
}
