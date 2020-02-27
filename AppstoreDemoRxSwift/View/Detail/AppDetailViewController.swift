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

class AppDetailViewController: UIViewController {
    
    @IBOutlet weak var appDetailTable: UITableView!
    let disposeBag = DisposeBag()
    
    var resultData : AppstoreSearchResult? = nil
    let viewModel = AppDetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewSetting()
        guard let data = resultData else {
            return
        }
        viewModel.item = data
        setRxView()
    }
    
    func tableViewSetting(){
       appDetailTable.tableFooterView = UIView()
        appDetailTable.rowHeight = UITableView.automaticDimension
    }
    fileprivate func setRxView(){
        viewModel.getItem()
            .bind(to: appDetailTable.rx.items(dataSource: AppDetailTableDataSource()))
            .disposed(by: disposeBag)
    }
    
}
