//
//  ContentView.swift
//  Parati
//
//  Created by Nicky Marino on 7/7/20.
//  Copyright © 2020 Nicky Marino. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var gradientA: [Color] = [Color(#colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)), Color(#colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1))]
    @State var gradientB: [Color] = [Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)), Color(#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1))]
    @State var useGradientA: Bool = true
    @State var isTapped: Bool = false
    
    func setGradient(_ value: [Color]) {
        useGradientA.toggle()
        if useGradientA {
            gradientA = value
        }
        else {
            gradientB = value
        }
    }
    
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 30, style: .continuous)
                    .fill(LinearGradient(gradient: Gradient(colors: self.gradientA), startPoint: UnitPoint(x: 0, y: 0), endPoint: UnitPoint(x: 1, y: 1)))
                    .opacity(self.useGradientA ? 1 : 0)
                    .animation(.easeInOut)
                RoundedRectangle(cornerRadius: 30, style: .continuous)
                    .fill(LinearGradient(gradient: Gradient(colors: self.gradientB), startPoint: UnitPoint(x: 0, y: 0), endPoint: UnitPoint(x: 1, y: 1)))
                    .opacity(self.useGradientA ? 0 : 1)
                    .animation(.easeInOut)
            }
            .padding(30)
            .scaleEffect(isTapped ? 1.05 : 1)
            .animation(.spring(response: 0.5, dampingFraction: 0.5, blendDuration: 0))
            .onTapGesture {
                self.isTapped = true
                self.useGradientA.toggle()
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    self.isTapped = false
                }
            }
            
            Spacer()
            
            HStack {
                Spacer()
                Image(systemName: "info.circle")
                Spacer()
                Image(systemName: "square.and.arrow.up")
                Spacer()
                Image(systemName: "goforward")
                    .onTapGesture {
                        self.setGradient(self.useGradientA ? self.gradientB : self.gradientA)
                }
                Spacer()
            }
            .padding(.horizontal)
            .font(.system(size: 25, weight: .medium))
            .foregroundColor(Color.white)
            // Use ColorMultiply because the animation can't control the foreground color
            .colorMultiply(self.useGradientA ? gradientA[1] : gradientB[1])
            .animation(.easeInOut)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
