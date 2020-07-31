//
//  ContentView.swift
//  Gradual
//
//  Created by Nicky Marino on 7/29/20.
//  Copyright © 2020 Nicky Marino. All rights reserved.
//

import SwiftUI

let screen = UIScreen.main.bounds

struct ContentView: View {
    @State var image = UIImage()
    @State var showShareSheet = false
    @State var captureGradient = false
    @State var testVar = false
    
    @State var colorIndex = 0
    @State var colorSets = [
        [Color.pink, Color.yellow],
        [Color.red, Color.purple],
        [Color.green, Color.white],
        [Color.purple, Color.black]
    ]
    @State var currentColors = [Color.purple, Color.black]
    
    func nextColors() {
        colorIndex = (colorIndex + 1) % colorSets.count
        print(colorIndex)
        currentColors = colorSets[colorIndex]
    }
    
    var body: some View {
        ZStack {
            GradientView(colors: $currentColors, image: $image, showShareSheet: $showShareSheet, captureGradient: $captureGradient)
            .frame(width: 300, height: 600)
                .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            
            VStack {
                Spacer()
                
                HStack {
                    Spacer()
                    Image(systemName: "arrow.2.circlepath.circle")
                        .font(.system(.largeTitle))
                        .onTapGesture {
                            self.nextColors()
                            self.testVar = true
                    }
                    Spacer()
                    Image(systemName: "square.and.arrow.up")
                        .font(.system(.largeTitle))
                        .onTapGesture {
                            self.captureGradient = true
                    }
                    Spacer()
                }
            }.padding()
            
        }        .sheet(isPresented: $showShareSheet, onDismiss: {self.showShareSheet = false},
                        content: {
                            ActivityView(activityItems: [self.image] as [Any], applicationActivities: nil) })
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

