//
//  HomeViewModel.swift
//  MyApp
//
//  Created by Chinh Pham N. on 7/9/19.
//  Copyright © 2019 Chinh Pham N. All rights reserved.
//

import RxCocoa
import RxSwift

protocol HomeViewModelType {
    var viewModelsDriver: Driver<[PhotoTableCellViewModelType]> { get }
}

final class HomeViewModel: HomeViewModelType {

    // MARK: - Properties

    private let service: NetworkService
    private let viewModelsSubject = BehaviorSubject<[PhotoTableCellViewModelType]>(value: [])
    private let disposedBag = DisposeBag()

    // MARK: - Initialize

    init(_ service: NetworkService, albumID: Int) {
        self.service = service

        service
            .load(ArrayResource<Photo>(action: AdvancedAction.photos(albumID: albumID)))
            .map { $0.map(PhotoTableCellViewModel.init) }
            .subscribe(viewModelsSubject)
            .disposed(by: disposedBag)
    }

    var viewModelsDriver: SharedSequence<DriverSharingStrategy, [PhotoTableCellViewModelType]> {
        return viewModelsSubject.asDriver(onErrorJustReturn: [])
    }
}
