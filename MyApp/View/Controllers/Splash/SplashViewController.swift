//
//  SplashViewController.swift
//  MyApp
//
//  Created by Chính Phạm on 7/8/19.
//  Copyright © 2019 Chinh Pham N. All rights reserved.
//

import UIKit

final class SplashViewController: UIViewController {

    // MARK: - IBOutlets

    @IBOutlet private weak var circleView: UIView!
    @IBOutlet private weak var helloWorldLabel: UILabel!

    // MARK: - Override

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: - Private Functions

    private func setupUI() {

        // Set language
        Bundle.set(language: .japanese)

        // Set text
        helloWorldLabel.text = R.string.localizable.helloWorld()

        // Animation
        UIView.animate(withDuration: 1.5, animations: {
            self.circleView.alpha = 1
        }, completion: { _ in
            UIView.animate(withDuration: 0.5, animations: {
                self.helloWorldLabel.alpha = 1
            })
        })

        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
            AppDelegate.shared.changeRoot(.tabBar(item: .home))
        }
    }
}
