//
//  Corners.swift
//  DrawingTest
//
//  Created by Christian Tietze on 27/12/16.
//  Copyright © 2016 Christian Tietze. All rights reserved.
//

import Cocoa

struct Corners {

    static var originZero: Corners { return Corners(ofRect: NSRect.zero) }

    fileprivate(set) var minX: CGFloat
    fileprivate(set) var maxX: CGFloat
    fileprivate(set) var minY: CGFloat
    fileprivate(set) var maxY: CGFloat

    var origin: NSPoint { return NSPoint(x: minX, y: minY) }
    var size: NSSize { return NSSize(width: maxX - minX, height: maxY - minY) }
    var bounds: NSRect { return NSRect(origin: origin, size: size) }

    var topLeft: NSPoint { return NSPoint(x: minX, y: maxY) }
    var topRight: NSPoint { return NSPoint(x: maxX, y: maxY) }
    var bottomRight: NSPoint { return NSPoint(x: maxX, y: minY) }
    var bottomLeft: NSPoint { return NSPoint(x: minX, y: minY) }

    init(_ a: NSPoint, _ b: NSPoint, _ c: NSPoint, _ d: NSPoint) {

        let points = [a, b, c, d]
        let xs = points.map { $0.x }.sorted()
        let ys = points.map { $0.y }.sorted()

        self.minX = xs.first ?? 0
        self.maxX = xs.last ?? 0
        self.minY = ys.first ?? 0
        self.maxY = ys.last ?? 0
    }

    init(ofRect rect: NSRect) {

        self.minX = NSMinX(rect)
        self.maxX = NSMaxX(rect)
        self.minY = NSMinY(rect)
        self.maxY = NSMaxY(rect)
    }

    init(originatingAt point: NSPoint) {

        self.minX = point.x
        self.maxX = point.x
        self.minY = point.y
        self.maxY = point.y
    }

    mutating func adjust(to point: NSPoint) {

        if self.minX > point.x { self.minX = point.x }
        if self.maxX < point.x { self.maxX = point.x }
        if self.minY > point.y { self.minY = point.y }
        if self.maxY < point.y { self.maxY = point.y }
    }

    func draw() {

        NSColor.yellow.set()
        NSRectFill(bounds)
    }
}
