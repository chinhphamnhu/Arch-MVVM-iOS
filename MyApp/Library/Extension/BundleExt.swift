//
//  BundleExt.swift
//  MyApp
//
//  Created by Chinh Pham N. on 7/9/19.
//  Copyright © 2019 Chinh Pham N. All rights reserved.
//

import UIKit

private var bundleKey: UInt8 = 0

final class BundleExtension: Bundle {
    override func localizedString(forKey key: String, value: String?, table tableName: String?) -> String {
        return (objc_getAssociatedObject(self, &bundleKey) as? Bundle)?
            .localizedString(forKey: key, value: value, table: tableName)
            ?? super.localizedString(forKey: key, value: value, table: tableName)
    }
}

extension Bundle {

    static let once: Void = {
        object_setClass(Bundle.main, type(of: BundleExtension()))
    }()

    static func set(language: Language) {
        Bundle.once
        let isLanguageRTL = Locale.characterDirection(forLanguage: language.code) == .rightToLeft
        UIView.appearance().semanticContentAttribute = isLanguageRTL ? .forceRightToLeft : .forceLeftToRight

        userDefaults.set(isLanguageRTL, forKey: "AppleTe  zxtDirection")
        userDefaults.set(isLanguageRTL, forKey: "NSForceRightToLeftWritingDirection")
        userDefaults.set([language.code], forKey: "AppleLanguages")
        userDefaults.synchronize()

        guard let path = Bundle.main.path(forResource: language.code, ofType: "lproj") else {
            log.error("Failed to get a bundle path.")
            return
        }

        objc_setAssociatedObject(
            Bundle.main,
            &bundleKey,
            Bundle(path: path),
            objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
}
