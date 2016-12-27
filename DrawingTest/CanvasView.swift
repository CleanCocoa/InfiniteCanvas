//
//  CanvasView.swift
//  DrawingTest
//
//  Created by Christian Tietze on 27/12/16.
//  Copyright © 2016 Christian Tietze. All rights reserved.
//

import Cocoa

@IBDesignable
class CanvasView: NSView {

    @IBInspectable
    var backgroundColor: NSColor = NSColor.white

    override func draw(_ dirtyRect: NSRect) {

        backgroundColor.setFill()
        NSRectFill(dirtyRect)

        super.draw(dirtyRect)
    }
}
