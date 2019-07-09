//
//  BasicNetworkService.swift
//  MyApp
//
//  Created by Chinh Pham N. on 7/9/19.
//  Copyright © 2019 Chinh Pham N. All rights reserved.
//

import RxSwift
import RxAlamofire

struct BasicNetworkService: NetworkService {

    func load<T>(_ resource: SingleItemResource<T>) -> Observable<T> where T: Codable {
        return RxAlamofire
            .request(resource.action)
            .responseJSON()
            .map { $0.data }
            .filter { $0 != nil }
            .map { $0.unwrapped(or: Data()) }
            .flatMap(resource.parse)
    }

    func load<T>(_ resource: ArrayResource<T>) -> Observable<[T]> where T: Codable {
        return RxAlamofire
            .request(resource.action)
            .responseJSON()
            .map { $0.data.unwrapped(or: Data()) }
            .flatMap(resource.parse)
    }
}
