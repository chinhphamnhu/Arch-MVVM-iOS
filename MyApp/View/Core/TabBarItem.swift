//
//  TabBarItem.swift
//  MyApp
//
//  Created by Chính Phạm on 7/8/19.
//  Copyright © 2019 Chinh Pham N. All rights reserved.
//

import UIKit

final class TabBarItem: UITabBarItem {

    // MARK: - Initialize

    override init() {
        super.init()
        badgeColor = .clear
        setBadgeTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.red], for: .normal)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
