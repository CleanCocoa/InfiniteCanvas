//
//  Stroke.swift
//  DrawingTest
//
//  Created by Christian Tietze on 27/12/16.
//  Copyright © 2016 Christian Tietze. All rights reserved.
//

import Cocoa

class Stroke: CanvasDrawable {

    var points: [NSPoint] = []
    var bounds: NSRect {
        // TODO: denormalize and change upon adding points for performance
        let xs = points.sorted { $0.x < $1.x }
        let ys = points.sorted { $0.y < $1.y }

        guard let left = xs.first?.x,
            let right = xs.last?.x,
            let bottom = ys.first?.y,
            let top = ys.last?.y
            else { return NSRect() }

        let width = right - left
        let height = top - bottom

        return NSRect(x: left, y: bottom, width: width, height: height)
    }

    var color: NSColor = NSColor.blue

    func add(point: NSPoint) {

        points.append(point)
    }

    init(startAt point: NSPoint) {

        self.points = [point]
    }

    func draw() {

        guard let firstPoint = points.first else { return }

        let path = NSBezierPath()
        path.move(to: firstPoint)

        for point in points.dropFirst() {
            path.line(to: point)
        }

        color.set()
        path.stroke()
    }
}
