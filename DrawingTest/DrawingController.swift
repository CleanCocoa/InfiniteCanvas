//
//  DrawingController.swift
//  DrawingTest
//
//  Created by Christian Tietze on 27/12/16.
//  Copyright © 2016 Christian Tietze. All rights reserved.
//

import Cocoa

class DrawingController: NSViewController {

    @IBOutlet var pressureLabel: NSTextField!

    var canvasView: CanvasView! { return self.view as? CanvasView }

    override func awakeFromNib() {
        super.awakeFromNib()

        let trackingArea = NSTrackingArea(rect: canvasView.frame, options: [.activeInActiveApp, .mouseMoved, .inVisibleRect], owner: self, userInfo: nil)
        canvasView.addTrackingArea(trackingArea)
    }

    override func mouseMoved(with event: NSEvent) {
        drawMouse(event)
        super.mouseMoved(with: event)
    }

    override func mouseDown(with event: NSEvent) {

        drawMouse(event)
        super.mouseDown(with: event)
    }

    override func mouseDragged(with event: NSEvent) {

        drawMouse(event)
        super.mouseDragged(with: event)
    }

    func drawMouse(_ event: NSEvent) {

        pressureLabel.stringValue = String(event.pressure)
    }
}
