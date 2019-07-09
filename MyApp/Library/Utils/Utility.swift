//
//  Utility.swift
//  MyApp
//
//  Created by Chinh Pham N. on 7/9/19.
//  Copyright © 2019 Chinh Pham N. All rights reserved.
//

import RxSwift

func ignoreNil<A>(x: A?) -> Observable<A> {
    return x.map { Observable.just($0) }.unwrapped(or: Observable.empty())
}
