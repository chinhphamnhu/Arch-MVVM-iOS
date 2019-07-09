//
//  Ratio.swift
//  MyApp
//
//  Created by Chính Phạm on 7/8/19.
//  Copyright © 2019 Chinh Pham N. All rights reserved.
//

import SwifterSwift

let ratio = Ratio.horizontal

enum DeviceType {
    case iPhone4
    case iPhone5
    case iPhone6
    case iPhone6p
    case iPhoneX
    case iPhoneXS
    case iPhoneXR
    case iPhoneXSMax
    case iPad
    case iPadPro105
    case iPadPro129

    var size: CGSize {
        switch self {
        case .iPhone4: return CGSize(width: 320, height: 480)
        case .iPhone5: return CGSize(width: 320, height: 568)
        case .iPhone6: return CGSize(width: 375, height: 667)
        case .iPhone6p: return CGSize(width: 414, height: 736)
        case .iPhoneX: return CGSize(width: 375, height: 812)
        case .iPhoneXS: return CGSize(width: 375, height: 812)
        case .iPhoneXR: return CGSize(width: 414, height: 896)
        case .iPhoneXSMax: return CGSize(width: 414, height: 896)
        case .iPad: return CGSize(width: 768, height: 1_024)
        case .iPadPro105: return CGSize(width: 834, height: 1_112)
        case .iPadPro129: return CGSize(width: 1_024, height: 1_366)
        }
    }

    /// Used to identify the current screen and check to fix
    /// some bugs on different screen layouts.
    /// This function returns results purpose to examine the case
    /// switch instead of having to check the conditions on each case.
    ///
    /// - Returns: Name of the current screen
    static func currentDevice() -> DeviceType {
        switch kScreenSize {
        case DeviceType.iPhone4.size: return .iPhone4
        case DeviceType.iPhone5.size: return .iPhone5
        case DeviceType.iPhone6.size: return .iPhone6
        case DeviceType.iPhone6p.size: return .iPhone6p
        case DeviceType.iPhoneX.size: return .iPhoneX
        case DeviceType.iPhoneXS.size: return .iPhoneXS
        case DeviceType.iPhoneXR.size: return .iPhoneXR
        case DeviceType.iPhoneXSMax.size: return .iPhoneXSMax
        case DeviceType.iPad.size: return .iPad
        case DeviceType.iPadPro105.size: return .iPadPro105
        case DeviceType.iPadPro129.size: return .iPadPro129
        default: return .iPad
        }
    }
}

struct Ratio {
    static let horizontal = kScreenSize.width / DeviceType.iPhone6.size.width
    static let vertical = kScreenSize.height / DeviceType.iPhone6.size.height
}

let kScreenSize = UIScreen.main.bounds.size
let iPhone = (UIDevice.current.userInterfaceIdiom == .phone)
let iPad = (UIDevice.current.userInterfaceIdiom == .pad)
let iPhone4 = (iPhone && DeviceType.iPhone4.size == kScreenSize)
let iPhone5 = (iPhone && DeviceType.iPhone5.size == kScreenSize)
let iPhone6 = (iPhone && DeviceType.iPhone6.size == kScreenSize)
let iPhone6p = (iPhone && DeviceType.iPhone6p.size == kScreenSize)
let iPhoneX = (iPhone && DeviceType.iPhoneX.size == kScreenSize)
let iPhoneXS = (iPhone && DeviceType.iPhoneXS.size == kScreenSize)
let iPhoneXR = (iPhone && DeviceType.iPhoneXR.size == kScreenSize)
let iPhoneXSMax = (iPhone && DeviceType.iPhoneXSMax.size == kScreenSize)
