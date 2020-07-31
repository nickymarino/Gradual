//
//  GradientView.swift
//  Gradual
//
//  Created by Nicky Marino on 7/30/20.
//  Copyright © 2020 Nicky Marino. All rights reserved.
//

import SwiftUI

/// Because `GradientSubView` will crash on `self.takeScreenshot` if it has any
/// `@State` vars, this is a wrapper to hold it's state variables and pass them as
/// bindings.
///
/// Because `View.onChanged` fires after the Share Sheet is presented, this wrapper
/// will deny a `captureGradient` toggle if the toggle occurs less than one second after
/// the previous toggle.
struct GradientView: View {
    @Binding var colors: [Color]
    @Binding var image: UIImage
    @Binding var showShareSheet: Bool
    @Binding var captureGradient: Bool

    @State private var lastScreenshot = Date()

    var body: some View {
        GradientSubView(colors: $colors, image: $image, showShareSheet: $showShareSheet, captureGradient: $captureGradient, lastScreenshot: $lastScreenshot)
    }
}

struct GradientSubView: View {
    @Binding var colors: [Color]
    @Binding var image: UIImage
    @Binding var showShareSheet: Bool
    @Binding var captureGradient: Bool
    @Binding var lastScreenshot: Date
    
    /// Number of seconds to ignore a second request for captureGradient
    var debounceInterval: Double = 3.0
    
    var body: some View {
        GeometryReader { geometry in
            // on change: https://stackoverflow.com/a/62523475/2597913
            LinearGradient(gradient: Gradient(colors: self.colors), startPoint: .topLeading, endPoint: .bottomTrailing)
                .onChange(of: self.captureGradient) { value in
                    // Leave if the flag is being unset
                    if !value { return }
                    
                    // Leave if it's too soon to screenshot again
                    let elapsed = Date().timeIntervalSince(self.lastScreenshot)
                    if elapsed <= self.debounceInterval {
                        self.captureGradient = false
                        return
                    }

                    self.lastScreenshot = Date()
                    self.image = self.takeScreenshot(origin: geometry.frame(in: .global).origin, size: geometry.size)
                    self.showShareSheet = true
            }
        }
    }
}

struct GradientView_Previews: PreviewProvider {
    static var previews: some View {
        GradientView(colors: .constant([Color(#colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)), Color(#colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1))]), image: .constant(UIImage()), showShareSheet: .constant(false), captureGradient: .constant(false))
    }
}


// MARK: - Extensions

extension UIImage {
    func aspectFitToHeight(_ newHeight: CGFloat) -> UIImage {
        let scale = newHeight / self.size.height
        let newWidth = self.size.width * scale
        let newSize = CGSize(width: newWidth, height: newHeight)
        let renderer = UIGraphicsImageRenderer(size: newSize)
        
        return renderer.image { _ in
            self.draw(in: CGRect(origin: .zero, size: newSize))
        }
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
        return hosting.view.renderedImage.aspectFitToHeight(screen.height)
    }
}
