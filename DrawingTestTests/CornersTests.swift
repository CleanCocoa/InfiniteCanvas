//
//  CornersTests.swift
//  DrawingTest
//
//  Created by Christian Tietze on 27/12/16.
//  Copyright © 2016 Christian Tietze. All rights reserved.
//

import XCTest
@testable import DrawingTest

class CornersTests: XCTestCase {

    func testInitFromRect() {

        let corners = Corners(ofRect: NSRect(x: 10, y: 20, width: 30, height: 10))

        XCTAssertEqual(corners.topLeft, NSPoint(x: 10, y: 30))
        XCTAssertEqual(corners.topRight, NSPoint(x: 40, y: 30))
        XCTAssertEqual(corners.bottomRight, NSPoint(x: 40, y: 20))
        XCTAssertEqual(corners.bottomLeft, NSPoint(x: 10, y: 20))
    }

    func testInitFromUnorderedPoints() {

        let corners = Corners(
            NSPoint(x: 4, y: 10),
            NSPoint(x: 33, y: 5),
            NSPoint(x: 8, y: 95),
            NSPoint(x: 1, y: 37))

        XCTAssertEqual(corners.topLeft, NSPoint(x: 1, y: 95))
        XCTAssertEqual(corners.topRight, NSPoint(x: 33, y: 95))
        XCTAssertEqual(corners.bottomRight, NSPoint(x: 33, y: 5))
        XCTAssertEqual(corners.bottomLeft, NSPoint(x: 1, y: 5))
    }

    func testBounds() {

        let rect = NSRect(x: 10, y: 20, width: 30, height: 10)
        let corners = Corners(ofRect: rect)
        XCTAssertEqual(corners.bounds, rect)
    }

    func testAdjusting_ToNE() {

        var corners = Corners(ofRect: NSRect(x: 10, y: 20, width: 30, height: 10))
        corners.adjust(to: NSPoint(x: 50, y: 50))

        XCTAssertEqual(corners.topLeft, NSPoint(x: 10, y: 50))
        XCTAssertEqual(corners.topRight, NSPoint(x: 50, y: 50))
        XCTAssertEqual(corners.bottomRight, NSPoint(x: 50, y: 20))
        XCTAssertEqual(corners.bottomLeft, NSPoint(x: 10, y: 20))
    }

    func testAdjusting_ToW() {

        var corners = Corners(ofRect: NSRect(x: 10, y: 20, width: 30, height: 10))
        corners.adjust(to: NSPoint(x: 5, y: 30))

        XCTAssertEqual(corners.topLeft, NSPoint(x: 5, y: 30))
        XCTAssertEqual(corners.topRight, NSPoint(x: 40, y: 30))
        XCTAssertEqual(corners.bottomRight, NSPoint(x: 40, y: 20))
        XCTAssertEqual(corners.bottomLeft, NSPoint(x: 5, y: 20))
    }

    func testAdjusting_ToNW() {

        var corners = Corners(originatingAt: NSPoint(x: 40, y: 90))
        corners.adjust(to: NSPoint(x: 20, y: 120))

        XCTAssertEqual(corners.topLeft, NSPoint(x: 20, y: 120))
        XCTAssertEqual(corners.topRight, NSPoint(x: 40, y: 120))
        XCTAssertEqual(corners.bottomRight, NSPoint(x: 40, y: 90))
        XCTAssertEqual(corners.bottomLeft, NSPoint(x: 20, y: 90))
    }
}
