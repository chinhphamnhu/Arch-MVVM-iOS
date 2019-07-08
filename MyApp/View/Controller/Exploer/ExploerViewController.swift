//
//  ExploerViewController.swift
//  MyApp
//
//  Created by Chính Phạm on 7/8/19.
//  Copyright © 2019 Chinh Pham N. All rights reserved.
//

import UIKit

final class ExploerViewController: ViewController {

    // MARK: - IBOutlets

    @IBOutlet private weak var welcomeLabel: UILabel!

    // MARK: - Override

    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.text = R.string.localizable.welcome()
    }
}
