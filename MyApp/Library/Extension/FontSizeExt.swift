//
//  FontSizeExt.swift
//  MyApp
//
//  Created by Chính Phạm on 7/8/19.
//  Copyright © 2019 Chinh Pham N. All rights reserved.
//

import UIKit

extension UILabel {
    @IBInspectable var fontSize: CGFloat {
        get { return self.fontSize }
        set {
            font = font.withSize(newValue.scaling)
        }
    }
}

extension UITextField {
    @IBInspectable var fontSize: CGFloat {
        get { return self.fontSize }
        set {
            font = font?.withSize(newValue.scaling)
        }
    }
}

extension UITextView {
    @IBInspectable var fontSize: CGFloat {
        get { return self.fontSize }
        set {
            font = font?.withSize(newValue.scaling)
        }
    }
}

extension UIButton {
    @IBInspectable var fontSize: CGFloat {
        get { return self.fontSize }
        set {
            titleLabel?.font = titleLabel?.font?.withSize(newValue.scaling)
        }
    }
}

extension UIFont {
    /**
     Will return the best approximated font size which will fit in the bounds.
     If no font with name `fontName` could be found, nil is returned.
     */
    static func bestFitFontSize(for text: String, in bounds: CGRect, fontName: String) -> CGFloat? {
        var maxFontSize: CGFloat = 21.0 // UIKit best renders with factors of 2
        guard let maxFont = UIFont(name: fontName, size: maxFontSize) else {
            return nil
        }

        let textWidth = text.width(withConstrainedHeight: bounds.height, font: maxFont)
        let textHeight = text.height(withConstrainedWidth: bounds.width, font: maxFont)

        // Determine the font scaling factor that should allow the string to fit in the given rect
        let scalingFactor = min(bounds.width / textWidth, bounds.height / textHeight)

        // Adjust font size
        maxFontSize *= scalingFactor

        return floor(maxFontSize)
    }
}
