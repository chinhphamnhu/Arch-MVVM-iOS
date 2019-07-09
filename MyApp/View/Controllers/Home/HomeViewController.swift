//
//  HomeViewController.swift
//  MyApp
//
//  Created by Chính Phạm on 7/8/19.
//  Copyright © 2019 Chinh Pham N. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

final class HomeViewController: ViewController {

    // MARK: - IBOutlets

    @IBOutlet private weak var tableView: UITableView!

    // MARK: - Properties

    private let viewModel: HomeViewModelType
    private let disposedBag = DisposeBag()

    // MARK: - Initialize

    init(_ viewModel: HomeViewModelType) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Override

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindToViewModel()
    }
}

// MARK: - Private Functions

extension HomeViewController {

    private func setupUI() {
        navigationItem.title = R.string.localizable.home()
        configTableView()
    }

    private func configTableView() {
        tableView.register(nibWithCellClass: PhotoTableCell.self)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
    }

    private func bindToViewModel() {
        viewModel.viewModelsDriver
            .drive(tableView.rx.items) { tableView, _, item in // _ -> row
                let cell = tableView.dequeueReusableCell(withClass: PhotoTableCell.self)
                cell.fillWith(item)
                return cell
            }
            .disposed(by: disposedBag)
    }
}
