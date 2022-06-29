//
//  ColorExtension.swift
//  RGBBullsEye
//
//  Created by 하진호 on 2022/06/28.
//

import SwiftUI

extension Color {
    static let element = Color("Element")
    static let highlight = Color("Highlight")
    static let shadow = Color("Shadow")
    
    init(rgbStruct rgb: RGB) {
        self.init(red: rgb.red, green: rgb.green, blue: rgb.blue)
    }
}
