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
            CardView(image: $image, showShareSheet: $showShareSheet, captureGradient: $captureGradient)
                .frame(width: 300, height: 600)
                .padding(.bottom)
            
            
            HStack {
                Spacer()
                Image(systemName: "arrow.2.circlepath.circle")
                    .font(.system(.largeTitle))
                    .onTapGesture {
//                        self.nextColors()
                }
                Spacer()
                Image(systemName: "square.and.arrow.up")
                    .font(.system(.largeTitle))
                    .onTapGesture {
                        self.captureGradient = true
                }
                Spacer()
            }
            
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

