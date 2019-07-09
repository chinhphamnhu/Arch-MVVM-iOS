//
//  PhotoTableCellViewModel.swift
//  MyApp
//
//  Created by Chinh Pham N. on 7/9/19.
//  Copyright © 2019 Chinh Pham N. All rights reserved.
//

import Foundation

protocol PhotoTableCellViewModelType {
    var title: String { get }
    var url: URL? { get }
    var thumbnailUrl: URL? { get }
}

struct PhotoTableCellViewModel: PhotoTableCellViewModelType {

    // MARK: - Properties

    private let photo: Photo

    // MARK: - Initialize

    init(_ photo: Photo) {
        self.photo = photo
    }

    // MARK: - Override Properties

    var title: String {
        return photo.title
    }

    var url: URL? {
        return URL(string: photo.url)
    }

    var thumbnailUrl: URL? {
        return URL(string: photo.thumbnailUrl)
    }
}
