//
//  PhotoTableCell.swift
//  MyApp
//
//  Created by Chinh Pham N. on 7/9/19.
//  Copyright © 2019 Chinh Pham N. All rights reserved.
//

import UIKit
import Kingfisher

final class PhotoTableCell: UITableViewCell {

    // MARK: - IBOutlets

    @IBOutlet private weak var thumbnailImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!

    // MARK: - Override

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    // MARK: - Public Functions

    func fillWith(_ viewModel: PhotoTableCellViewModelType) {
        titleLabel.text = viewModel.title
        thumbnailImageView.kf.setImage(with: viewModel.thumbnailUrl)
    }
}
