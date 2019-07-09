//
//  NetworkService.swift
//  MyApp
//
//  Created by Chinh Pham N. on 7/9/19.
//  Copyright © 2019 Chinh Pham N. All rights reserved.
//

import RxSwift

protocol NetworkService {
    func load<T>(_ resource: SingleItemResource<T>) -> Observable<T>
    func load<T>(_ resource: ArrayResource<T>) -> Observable<[T]>
}
