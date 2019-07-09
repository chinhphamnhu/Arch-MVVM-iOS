//
//  APIAction.swift
//  MyApp
//
//  Created by Chinh Pham N. on 7/9/19.
//  Copyright © 2019 Chinh Pham N. All rights reserved.
//

import Alamofire

protocol APIAction: URLRequestConvertible {
    var method: HTTPMethod { get }
    var path: String { get }
    var actionParameters: [String: Any] { get }
    var authHeader: [String: String] { get }
    var encoding: ParameterEncoding { get }
}

extension APIAction {
    var actionParameters: [String: Any] {
        return [:]
    }
    var authHeader: [String: String] {
        return [:]
    }
    var baseURL: String {
        return "https://jsonplaceholder.typicode.com"
    }
}
