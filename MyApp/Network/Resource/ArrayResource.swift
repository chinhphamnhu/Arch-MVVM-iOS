//
//  ArrayResource.swift
//  MyApp
//
//  Created by Chinh Pham N. on 7/9/19.
//  Copyright © 2019 Chinh Pham N. All rights reserved.
//

import RxSwift

struct ArrayResource<T: Codable> {
    let objectType = T.self
    let action: APIAction

    func parse(_ data: Data) -> Observable<[T]> {
        return Observable.create { observer in
            guard let result = try? JSONDecoder().decode([T].self, from: data) else {
                observer.onError(CustomError(value: "Can't map response."))
                return Disposables.create()
            }

            observer.onNext(result)
            return Disposables.create()
        }
    }
}

// MARK: - Cacheable

extension ArrayResource: Cacheable {
    var cacheKey: String {
        return "cache".appending(action.baseURL.appending(action.path))
    }
}
