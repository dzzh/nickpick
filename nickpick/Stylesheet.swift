//
//  Stylesheet.swift
//  nickpick
//
//  Created by Zmicier Zaleznicenka on 23/11/16.
//  Copyright © 2016 Zmicier. All rights reserved.
//

import Foundation
import UIKit.UIColor

let uiColorOrange =     UIColor.orange
let uiColorDarkBlue =   UIColor(hex: 0x091C6A)
let uiColorDirtyWhite = UIColor(hex: 0xEEEEEE)

extension UIColor {

    convenience init(hex: Int, alpha: Float) {
        let components = (
                R: CGFloat((hex >> 16) & 0xff) / 255,
                G: CGFloat((hex >> 08) & 0xff) / 255,
                B: CGFloat((hex >> 00) & 0xff) / 255)

        self.init(red: components.R, green: components.G, blue: components.B, alpha: CGFloat(alpha))
    }

    convenience init(hex: Int) {
        self.init(hex: hex, alpha: 1)
    }

}
