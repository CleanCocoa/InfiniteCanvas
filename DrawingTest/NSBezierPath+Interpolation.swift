//
//  NSBezierPath+Interpolation.swift
//  DrawingTest
//
//  Created by Christian Tietze on 27/12/16.
//  Copyright © 2016 Christian Tietze. All rights reserved.
//

import Cocoa

extension NSBezierPath {

    func interpolateLinear(points: [NSPoint]) {

        guard let firstPoint = points.first else { return }

        self.move(to: firstPoint)

        for point in points.dropFirst() {
            self.line(to: point)
        }
    }

    /// <https://github.com/FlexMonkey/ImageToneCurveEditor/blob/master/ToneCurveEditor/UIBezierPathExtension.swift>
    func interpolatePointsWithHermite(points: [CGPoint], alpha: CGFloat = 1.0/3.0) {

        guard !points.isEmpty else { return }

        self.move(to: points[0])

        let n = points.count - 1

        for index in 0..<n
        {
            var currentPoint = points[index]
            var nextIndex = (index + 1) % points.count
            var prevIndex = index == 0 ? points.count - 1 : index - 1
            var previousPoint = points[prevIndex]
            var nextPoint = points[nextIndex]
            let endPoint = nextPoint
            var mx : CGFloat
            var my : CGFloat

            if index > 0
            {
                mx = (nextPoint.x - previousPoint.x) / 2.0
                my = (nextPoint.y - previousPoint.y) / 2.0
            }
            else
            {
                mx = (nextPoint.x - currentPoint.x) / 2.0
                my = (nextPoint.y - currentPoint.y) / 2.0
            }

            let controlPoint1 = CGPoint(x: currentPoint.x + mx * alpha, y: currentPoint.y + my * alpha)
            currentPoint = points[nextIndex]
            nextIndex = (nextIndex + 1) % points.count
            prevIndex = index
            previousPoint = points[prevIndex]
            nextPoint = points[nextIndex]

            if index < n - 1
            {
                mx = (nextPoint.x - previousPoint.x) / 2.0
                my = (nextPoint.y - previousPoint.y) / 2.0
            }
            else
            {
                mx = (currentPoint.x - previousPoint.x) / 2.0
                my = (currentPoint.y - previousPoint.y) / 2.0
            }

            let controlPoint2 = CGPoint(x: currentPoint.x - mx * alpha, y: currentPoint.y - my * alpha)

            self.curve(to: endPoint, controlPoint1: controlPoint1, controlPoint2: controlPoint2)
        }
    }
}
