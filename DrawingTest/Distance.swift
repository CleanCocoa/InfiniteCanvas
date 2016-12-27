//
//  Distance.swift
//  DrawingTest
//
//  Created by Christian Tietze on 27/12/16.
//  Copyright © 2016 Christian Tietze. All rights reserved.
//

import Foundation

struct Distance {

    let horizontal: CGFloat
    let vertical: CGFloat

    init(_ a: NSPoint, _ b: NSPoint) {

        self.horizontal = abs(a.x - b.x)
        self.vertical = abs(a.y - b.y)
    }

    func above(_ threshold: CGFloat) -> Bool {
        return horizontal > threshold
            || vertical > threshold
            || sqrt(pow(horizontal, 2) + pow(vertical, 2)) > threshold
    }
}

extension CGPoint{

    func distance(to other: CGPoint) -> Distance {
        return Distance(self, other)
    }
}
