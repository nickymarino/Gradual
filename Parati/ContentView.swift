//
//  ContentView.swift
//  Parati
//
//  Created by Nicky Marino on 7/7/20.
//  Copyright © 2020 Nicky Marino. All rights reserved.
//

import SwiftUI

class GradientFactory {
    private var currentIndex: Int = 0
    private var lastIndex: Int? = nil
    private let gradients: [[Color]] = [
        [Color(#colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)), Color(#colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1))],
        [Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)), Color(#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1))],
        [Color(#colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)), Color(#colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1))],
        [Color(#colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)), Color(#colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1))],
        [Color(#colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1)), Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1))],
        [Color(#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)), Color(#colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1))],
    ]
    
    func next() -> [Color] {
        if lastIndex != nil {
            repeat {
                currentIndex = gradients.indices.randomElement()!
            } while (currentIndex == lastIndex)
        } else {
            currentIndex = gradients.indices.randomElement()!
        }
        lastIndex = currentIndex
        return gradients[currentIndex]
    }
}

class GradientSwitcher: ObservableObject {
    @Published var first: [Color] = [Color(#colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)), Color(#colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1))]
    @Published var second: [Color] = [Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)), Color(#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1))]
    @Published var useFirst: Bool = true

    private var gradientFactory = GradientFactory()

    func change() {
        let nextGradient = gradientFactory.next()

        useFirst.toggle()
        if useFirst {
            first = nextGradient
        }
        else {
            second = nextGradient
        }
    }
        
    func bottomColor() -> Color {
        if useFirst {
            return first[1]
        }
        return second[1]
    }
}

struct ContentView: View {
    @ObservedObject var gradients = GradientSwitcher()
    
    var body: some View {
        VStack {
            CardView(gradients: gradients, onTapAction: { self.gradients.change() })
            
            Spacer()
            
            HStack {
                Spacer()
                ButtonView(systemName: "info.circle", action: {})
                Spacer()
                // https://developer.apple.com/forums/thread/123951
                // https://swiftui.gallery/uploads/code/ShareSheet.html
                ButtonView(systemName: "square.and.arrow.up", action: {})
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
        }
    }
}

struct CardView: View {
    @ObservedObject var gradients: GradientSwitcher
    var onTapAction: () -> Void
    
    @State var isTapped: Bool = false
    @State var isDebounced: Bool = false
    @State var viewState = CGSize.zero
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .fill(LinearGradient(gradient: Gradient(colors: self.gradients.first), startPoint: UnitPoint(x: 0, y: 0), endPoint: UnitPoint(x: 1, y: 1)))
                .opacity(self.gradients.useFirst ? 1 : 0)
                .animation(.easeInOut)
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .fill(LinearGradient(gradient: Gradient(colors: self.gradients.second), startPoint: UnitPoint(x: 0, y: 0), endPoint: UnitPoint(x: 1, y: 1)))
                .opacity(self.gradients.useFirst ? 0 : 1)
                .animation(.easeInOut)
        }
        .padding(30)
        .offset(x: viewState.width / 20, y: viewState.height / 20)
            // Tap effects
            .scaleEffect(isTapped ? 1.05 : 1)
            .animation(.spring(response: 0.5, dampingFraction: 0.5, blendDuration: 0))
            .onTapGesture {
                if !self.isDebounced {
                    self.isTapped = true
                    self.isDebounced = true
                    
                    self.onTapAction()
                    
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

struct ButtonView: View {
    var systemName: String
    var action: () -> Void
    
    @State var isTapped: Bool = false
    @State var isDebounced: Bool = false
    
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
