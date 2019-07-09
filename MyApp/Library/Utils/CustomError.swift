//
//  CustomError.swift
//  MyApp
//
//  Created by Chinh Pham N. on 7/9/19.
//  Copyright © 2019 Chinh Pham N. All rights reserved.
//

import Foundation

struct CustomError: LocalizedError {
    let value: String

    var localizedDescription: String {
        return value
    }
}
