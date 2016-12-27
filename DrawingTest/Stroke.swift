//
//  Stroke.swift
//  DrawingTest
//
//  Created by Christian Tietze on 27/12/16.
//  Copyright © 2016 Christian Tietze. All rights reserved.
//

import Cocoa

class Stroke: CanvasDrawable {

    var points: [NSPoint]
    var corners: Corners
    var bounds: NSRect {
        return corners.bounds
    }

    var color: NSColor = NSColor.blue

    func add(point: NSPoint) {

        points.append(point)
        corners.adjust(to: point)
    }

    init(startAt point: NSPoint) {

        self.points = [point]
        self.corners = Corners(originatingAt: point)
    }

    func draw() {

        // drawBoundingBox()
        drawPath()
    }

    fileprivate func drawBoundingBox() {

        corners.draw()
    }

    fileprivate func drawPath() {

        guard let firstPoint = points.first else { return }

        let path = NSBezierPath()
        path.move(to: firstPoint)

        for point in points.dropFirst() {
            path.line(to: point)
        }

        color.set()
        path.lineWidth = 3  
        path.stroke()
    }
}
