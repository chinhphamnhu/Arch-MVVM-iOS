//
//  AppDelegate.swift
//  MyApp
//
//  Created by Chinh Pham N. on 7/8/19.
//  Copyright © 2019 Chinh Pham N. All rights reserved.
//

import UIKit
import SVProgressHUD
import XCGLogger

typealias HUD = SVProgressHUD
let log = XCGLogger.default
let screenSize = UIScreen.main.bounds.size
let userDefaults = UserDefaults.standard

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: - Enum

    enum RootType {
        case tabBar(item: TabbarController.TabType)
        // TODO: - Define some screen here: introduct or tutorial
    }

    // MARK: - Properties

    var window: UIWindow?

    static let shared: AppDelegate = {
        guard let shared = UIApplication.shared.delegate as? AppDelegate else {
            fatalError("Cannot cast `UIApplication.shared.delegate` to `AppDelegate`.")
        }
        return shared
    }()

    // MARK: - UIApplicationDelegate

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        window?.makeKeyAndVisible()
        window?.rootViewController = SplashViewController()

        log.setup(
            level: .debug,
            showThreadName: true,
            showLevel: true,
            showFileNames: true,
            showLineNumbers: true,
            fileLevel: .debug)
        return true
    }
}

// MARK: - Public Functions

extension AppDelegate {

    func changeRoot(_ rootType: RootType) {
        let target: UIViewController
        switch rootType {
        case .tabBar(let item):
            target = TabbarController(selectedTab: item)
        }
        window?.rootViewController = target
    }
}
