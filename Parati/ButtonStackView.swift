//
//  ButtonStackView.swift
//  Parati
//
//  Created by Nicky Marino on 7/9/20.
//  Copyright © 2020 Nicky Marino. All rights reserved.
//

import SwiftUI

struct ButtonStackView: View {
    @ObservedObject var gradients: GradientSwitcher
    
    @State private var showingShareSheet = false
    
    var body: some View {
        HStack {
            Spacer()
            ButtonView(systemName: "info.circle", action: {})
            Spacer()
            // https://developer.apple.com/forums/thread/123951
            ButtonView(systemName: "square.and.arrow.up", action: { self.showingShareSheet = true })
            Spacer()
            ButtonView(systemName: "goforward", action: { self.gradients.change() })
            Spacer()
        }
        .padding(.horizontal)
        .offset(x: 0, y: -10)
        .font(.system(size: 25, weight: .medium))
        .foregroundColor(Color.white)
            // Use ColorMultiply because the animation can't control the foreground color
            .colorMultiply(self.gradients.bottomColor())
            .animation(.easeInOut)
            .sheet(isPresented: $showingShareSheet,
                   content: {
                    ActivityView(activityItems: [NSURL(string: "https://nickymarino.com")!] as [Any], applicationActivities: nil) })
    }
}


struct ButtonView: View {
    var systemName: String
    var action: () -> Void
    
    @State private var isTapped: Bool = false
    @State private var isDebounced: Bool = false
    
    var body: some View {
        Image(systemName: systemName)
            .scaleEffect(isTapped ? 1.15 : 1)
            .animation(.spring(response: 0.5, dampingFraction: 0.5, blendDuration: 0))
            .onTapGesture {
                if !self.isDebounced {
                    self.isTapped = true
                    self.isDebounced = true
                    self.action()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        self.isTapped = false
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                        self.isDebounced = false
                    }
                }
            }
    }
}

struct ButtonStackView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonStackView(gradients: GradientSwitcher(freezeOn: Color.black))
    }
}
