//
//  ContentView.swift
//  Parati
//
//  Created by Nicky Marino on 7/7/20.
//  Copyright © 2020 Nicky Marino. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var palettes = PaletteSwitcher()
    @State private var hideUI = false
    
    var body: some View {
        ZStack {
            CardView(palettes: palettes)
                .edgesIgnoringSafeArea(.all)
                .onTapGesture {
                    self.hideUI.toggle()
                }
            
            VStack {
                Spacer()
                ButtonStackView(palettes: palettes)
                    .padding(.horizontal)
                    .offset(x: 0, y: -10)
                    .opacity(hideUI ? 0 : 1)
            }
        }
        .statusBar(hidden: hideUI)
        .animation(.easeInOut)
        // Randomly pick a new gradient when the view loads for the first time
        .onAppear(perform: { self.palettes.rotate() })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

let screen = UIScreen.main.bounds
