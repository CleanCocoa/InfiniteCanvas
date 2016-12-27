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
        return corners.bounds(enlargedBy: 3)
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

//        drawBoundingBox()

        let path = interpolatedPath(points: points)
        drawPath(path: path)
    }

    fileprivate func drawBoundingBox() {

        corners.draw()
    }

    fileprivate func drawPath(path: NSBezierPath) {

        color.set()
        path.lineWidth = 3
        path.stroke()
    }
}

fileprivate func interpolatedPath(points: [NSPoint]) -> NSBezierPath {

    let path = NSBezierPath()
    path.interpolatePointsWithHermite(points: points)
    return path
}
