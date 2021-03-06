//
//  KeyboardTemplate.swift
//  EducKeyboard
//
//  Created by omri maman on 18/05/15.
//  Copyright (c) 2015 sap. All rights reserved.
//

import Foundation
import UIKit

extension String {
    var floatValue: Float {
        return (self as NSString).floatValue
    }
}

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(netHex:Int) {
        self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff)
    }
    
    convenience init(string: String) {
        let array = split(string){$0 == ","}
        assert(array.count == 4, "Invalid string schema" )
        let (r,g,b,a) = (CGFloat(array[0].floatValue),CGFloat(array[1].floatValue),CGFloat( array[2].floatValue), CGFloat(array[3].floatValue))
        self.init(red: r, green: g, blue: b, alpha: a)
    }
    
    var stringValue:String?  {
        get{
            var r:CGFloat = 0,g:CGFloat = 0,b:CGFloat = 0
            var a:CGFloat = 0
            
            if self.getRed(&r, green: &g, blue: &b, alpha: &a){
                let colorText = NSString(format: "%4.4f,%4.4f,%4.4f,%4.4f",
                    Float(r),Float(g),Float(b),Float(a))
                return colorText as String
            }
            return nil
        }
    }
}


class KeyboardTemplates {

    var keyboardBackgroundColor : String {
        get {
            return self.keyboardBackgroundColor
        }
        set {
            self.keyboardBackgroundColor = newValue
        }
    }
    
    var keysTextColor : String {
        get {
            return self.keysTextColor
        }
        set {
            self.keysTextColor = newValue
        }
    }

    var keysBackgroundColor : String {
        get {
            return self.keysBackgroundColor
        }
        set {
            self.keysBackgroundColor = newValue
        }
    }

    var Font : String{
        get {
            return self.Font
        }
        set {
            self.Font = newValue
        }
    }
    
    init(keyboardBackgroundColor : String, keysTextColor : String, keysBackgroundColor : String, RowOrCol : String, Font : String) {
        
        self.keyboardBackgroundColor = keyboardBackgroundColor
        self.Font = Font
        self.keysTextColor = keysTextColor
        self.keysBackgroundColor = keysBackgroundColor
    }
}