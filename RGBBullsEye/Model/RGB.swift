//
//  RGB.swift
//  RGBBullsEye
//
//  Created by 하진호 on 2022/06/28.
//

import Foundation

struct RGB {
    var red = 0.3
    var green = 0.3
    var blue = 0.7
    
    static func random() -> RGB {
        var rgb = RGB()
        rgb.red = Double.random(in: 0..<1)
        rgb.green = Double.random(in: 0..<1)
        rgb.blue = Double.random(in: 0..<1)
        return rgb
    }
    
    func difference(target: RGB) -> Double {
        let rDiff = red - target.red
        let gDiff = green - target.green
        let bDiff = blue - target.blue
        return sqrt((rDiff * rDiff + gDiff * gDiff + bDiff * bDiff) / 3.0)
    }
    
    func intString() -> String {
        "R: \(Int(self.red * 255.0)) G: \(Int(self.green * 255.0)) B: \(Int(self.blue * 255.0))"
    }
}
