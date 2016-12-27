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
    var width: CGFloat = 3
    var precision: CGFloat = 3

    init(startAt point: NSPoint) {

        self.points = [point]
        self.corners = Corners(originatingAt: point)
    }

    func add(point: NSPoint) {

        guard keepsPrecisionDistanceToLastPoint(point) else { return }

        points.append(point)
        corners.adjust(to: point)
    }

    fileprivate func keepsPrecisionDistanceToLastPoint(_ point: NSPoint) -> Bool {

        guard let lastPoint = points.last else { return true }

        let delta = lastPoint.distance(to: point)
        return delta.above(4)
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
        path.lineWidth = width
        path.stroke()
    }
}

extension CGPoint{

    func translate(x: CGFloat = 0, y: CGFloat = 0) -> CGPoint {
        return CGPoint(x: self.x + x, y: self.y + y)
    }
}

fileprivate func interpolatedPath(points: [NSPoint]) -> NSBezierPath {

    var points = points

    // Make dot visible
    if points.count == 1 {
        points.append(points[0].translate(x: 1, y: 1))
    }

    let path = NSBezierPath()
//    path.interpolateLinear(points: points)
    path.interpolatePointsWithHermite(points: points)
    return path
}
