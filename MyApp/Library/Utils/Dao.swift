//
//  Dao.swift
//  MyApp
//
//  Created by Chinh Pham N. on 7/9/19.
//  Copyright © 2019 Chinh Pham N. All rights reserved.
//

import UIKit

protocol Dao { }

extension NSObject: Dao { }

extension Dao where Self: NSObject {

    typealias MultipleClosure = (Self) -> Void

    init(_ closures: MultipleClosure...) {
        self.init()
        closures.forEach { $0(self) }
    }
}

extension Dao where Self: UIButton {
    init(type: UIButton.ButtonType, closure: (Self) -> Void) {
        guard let self = UIButton(type: type) as? Self else { fatalError() }
        closure(self)
        self.init()
    }
}
