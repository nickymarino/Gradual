//
//  ContentView.swift
//  Gradual
//
//  Created by Nicky Marino on 7/29/20.
//  Copyright © 2020 Nicky Marino. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var image = UIImage()
    @State var showShareSheet = false
    
    @State var colorIndex = 0
    @State var colorSets = [
        [Color.pink, Color.yellow],
        [Color.red, Color.purple],
        [Color.green, Color.white]
    ]
    @State var currentColors = [Color.purple, Color.black]
    
    func nextColors() {
        colorIndex = (colorIndex + 1) % colorSets.count
        currentColors = colorSets[colorIndex]
    }
    
    var body: some View {
        ZStack {
            GradientView(colors: $currentColors, image: $image, onClick: {self.showShareSheet = true})
            
            VStack {
                Spacer()
                
                Image(systemName: "arrow.2.circlepath.circle")
                    .font(.system(.largeTitle))
                    .onTapGesture {
                        self.nextColors()
                }
            }
            
        }        .sheet(isPresented: $showShareSheet,
                        content: {
                            ActivityView(activityItems: [self.image] as [Any], applicationActivities: nil) })
    }
}

struct GradientView: View {
    @Binding var colors: [Color]
    @Binding var image: UIImage
    var onClick: (() -> Void)
    
    var body: some View {
        GeometryReader { geometry in
            LinearGradient(gradient: Gradient(colors: self.colors), startPoint: .topLeading, endPoint: .bottomTrailing)
                .onTapGesture {
                    let tempImage = self.takeScreenshot(origin: geometry.frame(in: .global).origin, size: geometry.size)
                    print(tempImage)
                    self.image = tempImage
                    self.onClick()
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension UIView {
    var renderedImage: UIImage {
        // rect of capure
        let rect = self.bounds
        // create the context of bitmap
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        let context: CGContext = UIGraphicsGetCurrentContext()!
        self.layer.render(in: context)
        // get a image from current context bitmap
        let capturedImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return capturedImage
    }
}

extension View {
    func takeScreenshot(origin: CGPoint, size: CGSize) -> UIImage {
        let window = UIWindow(frame: CGRect(origin: origin, size: size))
        let hosting = UIHostingController(rootView: self)
        hosting.view.frame = window.frame
        window.addSubview(hosting.view)
        window.makeKeyAndVisible()
        return hosting.view.renderedImage
    }
}
