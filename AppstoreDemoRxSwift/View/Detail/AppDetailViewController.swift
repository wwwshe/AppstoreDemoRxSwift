//
//  AppDetailViewController.swift
//  AppstoreDemoRxSwift
//
//  Created by jun wook on 2020/02/27.
//  Copyright © 2020 jungwook. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources

final class AppDetailViewController: ViewControllerHelper {

    @IBOutlet weak var appDetailTable: UITableView!
    let disposeBag = DisposeBag()

    var resultData: AppstoreSearchResult?
    private let viewModel = AppDetailViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewSetting()
        guard let data = resultData else {
            return
        }
        viewModel.item = data
        setRxView()
    }

    private func tableViewSetting() {
        appDetailTable.tableFooterView = UIView()
        appDetailTable.rowHeight = UITableView.automaticDimension
    }

    private func setRxView() {
        let datasource = AppDetailTableDataSource()

        viewModel.getItem()
            .bind(to: appDetailTable.rx.items(dataSource: datasource))
            .disposed(by: disposeBag)

        datasource.parentViewcontroller = self

        appDetailTable.rx.itemSelected
            .asDriver()
            .drive(onNext: { [weak self] indexPath in
                guard let self = self else { return }

                let section = indexPath.section
                let row = indexPath.row

                switch section {
                case 3:
                    if let controller = self.getViewController(target: ImageSlideViewController.self) {
                        controller.images = self.viewModel.item?.screenshotUrls ?? [String]()
                        self.navigationController?.pushViewController(controller, animated: true)
                    }
                case 5:
                    if row == 3 {
                        let isExpand = datasource.isInfoCellExpands[indexPath.row]
                        if isExpand == false {
                            datasource.isInfoCellExpands[indexPath.row] = !isExpand
                            self.appDetailTable.beginUpdates()
                            self.appDetailTable.reloadSections([indexPath.section],
                                                               animationStyle: .automatic)
                            self.appDetailTable.endUpdates()
                        }
                    }

                default:
                    break
                }
            }).disposed(by: disposeBag)
    }
}
