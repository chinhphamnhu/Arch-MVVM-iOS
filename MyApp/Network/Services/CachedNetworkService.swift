//
//  CachedNetworkService.swift
//  MyApp
//
//  Created by Chinh Pham N. on 7/9/19.
//  Copyright © 2019 Chinh Pham N. All rights reserved.
//

import RxSwift
import CoreData

struct CachedNetworkService: NetworkService {

    // MARK: - Properties

    private let networkService: NetworkService
    private let cache = Cache()
    private let disposedBag = DisposeBag()

    // MARK: - Initialize

    init(_ service: NetworkService) {
        networkService = service
    }

    // MARK: - Override

    func load<T>(_ resource: SingleItemResource<T>) -> Observable<T> where T: Codable {
        return Observable.create { observer in

            // TODO: - Implement valid cache interaction like in ArrayResource' load method

            if let cached = self.cache.loadData(for: resource) {
                observer.onNext(cached)
            }

            self.networkService
                .load(resource)
                .subscribe(observer)
                .disposed(by: self.disposedBag)

            return Disposables.create()
        }
    }

    func load<T>(_ resource: ArrayResource<T>) -> Observable<[T]> where T: Codable {
        return Observable.create { observer in
            let cached = self.cache.loadData(for: resource)
            observer.onNext(cached)

            let requestResultObservable = self.networkService.load(resource)

            requestResultObservable
                .filter { !$0.isEmpty }
                .subscribe(onNext: { array in
                    observer.onNext(array)
                })
                .disposed(by: self.disposedBag)

            requestResultObservable
                .map(JSONEncoder().encode)
                .map { ($0, resource) }
                .subscribe(onNext: { pair in
                    self.cache.save(pair.0, for: pair.1)
                })
                .disposed(by: self.disposedBag)

            return Disposables.create()
        }
    }
}
