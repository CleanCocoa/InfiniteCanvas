//
//  Crosshair.swift
//  DrawingTest
//
//  Created by Christian Tietze on 27/12/16.
//  Copyright © 2016 Christian Tietze. All rights reserved.
//

import Cocoa

struct Crosshair {
    static let color = NSColor.black

    enum Dimensions {
        static let width: CGFloat = 20
        static let height: CGFloat = 20
    }

    let location: NSPoint
    var bounds: NSRect {
        return NSRect(
            x: location.x - Dimensions.width / 2,
            y: location.y - Dimensions.height / 2,
            width: Dimensions.width,
            height: Dimensions.height)
    }

    func draw() {

        Crosshair.color.set()
        let bounds = self.bounds
        NSRectFill(NSRect(x: bounds.origin.x, y: location.y, width: bounds.width, height: 1))
        NSRectFill(NSRect(x: location.x, y: bounds.origin.y, width: 1, height: bounds.height))
    }
}
