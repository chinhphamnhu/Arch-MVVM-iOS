//
//  AdvancedAction.swift
//  MyApp
//
//  Created by Chinh Pham N. on 7/9/19.
//  Copyright © 2019 Chinh Pham N. All rights reserved.
//

import Alamofire

enum AdvancedAction: APIAction {
    case feeds(page: Int)
    case photos(albumID: Int)

    var method: HTTPMethod {
        return .get
    }

    var path: String {
        switch self {
        case let .feeds(page): return "/feeds/\(page)"
        case let .photos(albumID): return "/albums/\(albumID)/photos"
        }
    }

    var encoding: ParameterEncoding {
        return URLEncoding.default
    }

    func asURLRequest() throws -> URLRequest {
        let originalRequest = try URLRequest(
            url: baseURL.appending(path),
            method: method, headers: authHeader)

        let encodedRequest = try encoding.encode(originalRequest, with: actionParameters)
        return encodedRequest
    }
}
