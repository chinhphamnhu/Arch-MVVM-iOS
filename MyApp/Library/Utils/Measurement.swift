//
//  Measurement.swift
//  MyApp
//
//  Created by Chính Phạm on 7/8/19.
//  Copyright © 2019 Chinh Pham N. All rights reserved.
//

import UIKit

struct Measurement {
    static var tabBarHeight: CGFloat {
        if iPhoneX || iPhoneXR {
            return 89
        } else {
            return 55
        }
    }

    static var homeButtonHeight: CGFloat {
        if iPhoneX || iPhoneXR {
            return 34
        } else {
            return 0
        }
    }

    static var statusBarHeight: CGFloat {
        if iPhoneX || iPhoneXR {
            return 44
        } else {
            return 20
        }
    }

    static let navigationBarHeight: CGFloat = 50

    static let iconTabbarSize = CGSize(width: 22, height: 22)
}
