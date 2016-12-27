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

        self.drawCrosshair()
    }

    func drawCrosshair() {

        guard let crosshair = crosshair  else { return }

        crosshair.draw()
    }

    var crosshair: Crosshair? {
        didSet {
            if let oldValue = oldValue {
                self.setNeedsDisplay(oldValue.bounds)
            }

            if let newValue = crosshair {
                self.setNeedsDisplay(newValue.bounds)
            }
        }
    }

    func moveCrosshair(with event: NSEvent) {

        let location = convert(event.locationInWindow, from: nil)
        self.crosshair = Crosshair(location: location)
    }


    // MARK: -

    override func mouseMoved(with event: NSEvent) {

        moveCrosshair(with: event)
    }

    override func mouseDragged(with event: NSEvent) {

        moveCrosshair(with: event)
    }
}
