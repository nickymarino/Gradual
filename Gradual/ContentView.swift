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
    
    var body: some View {
        VStack {
            ZStack {
                CardView(image: $image, showShareSheet: $showShareSheet, captureGradient: $captureGradient)
                    .padding(20)
            }

            // Share button
            HStack {
                Spacer()
                Image(systemName: "square.and.arrow.up")
                    .font(.system(.largeTitle))
                    .onTapGesture {
                        self.captureGradient = true
                    }
                Spacer()
            }
            .offset(y: -10)
        }
        .sheet(isPresented: $showShareSheet, onDismiss: {self.showShareSheet = false}) {
            ActivityView(activityItems: [self.image] as [Any], applicationActivities: nil)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

