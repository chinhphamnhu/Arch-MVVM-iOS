//
//  TabbarController.swift
//  MyApp
//
//  Created by Chính Phạm on 7/8/19.
//  Copyright © 2019 Chinh Pham N. All rights reserved.
//

import UIKit

final class TabbarController: UITabBarController {

    // MARK: - Initialize

    convenience init(selectedTab: TabType) {
        self.init()
        setupData()
        selectedIndex = selectedTab.rawValue
    }

    // MARK: - Override

    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
}

// MARK: - Private Functions

extension TabbarController {

    private func configUI() {
        tabBar.isTranslucent = false
        tabBar.barTintColor = .white
        tabBar.tintColor = R.color.main()
    }

    private func setupData() {
        var controllers: [UINavigationController] = []

        TabType.allCases.forEach { item in
            let navigation = UINavigationController(rootViewController: item.controller)
            navigation.tabBarItem = TabBarItem(
                title: item.title,
                image: item.icon,
                selectedImage: nil)
            controllers.append(navigation)
        }

        setViewControllers(controllers, animated: true)
    }
}

// MARK: - Enum

extension TabbarController {

    enum TabType: Int, CaseIterable {
        case home
        case exploer
        case setting

        var title: String {
            switch self {
            case .home: return "Home"
            case .exploer: return "Exploer"
            case .setting: return "Setting"
            }
        }

        var icon: UIImage? {
            switch self {
            case .home: return UIImage()
            case .exploer: return UIImage()
            case .setting: return UIImage()
            }
        }

        var controller: ViewController {
            switch self {
            case .home: return HomeViewController()
            case .exploer: return ExploerViewController()
            case .setting: return SettingViewController()
            }
        }
    }
}
