//
//  SearchViewController.swift
//  AppstoreDemoRxSwift
//
//  Created by jungwook on 2020/01/29.
//  Copyright © 2020 jungwook. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

final class BeforeSearchViewController: ViewControllerHelper {

   @IBOutlet weak var beforeSearchWordTable: UITableView!

   var viewModel = BeforeSearchViewModel()
   let disposeBag = DisposeBag()
   var listController: SearchListViewController?
   var searchController: UISearchController!

   override func viewDidLoad() {
      super.viewDidLoad()
      setController()
      setRxView()
   }

   private func setController() {
      listController = self.getViewController(target: SearchListViewController.self)
      searchController = UISearchController(searchResultsController: listController)
      searchController.searchResultsUpdater = listController
      searchController.searchBar.delegate = listController
      searchController.obscuresBackgroundDuringPresentation = false
      tableViewSetting()
      self.navigationItem.searchController = searchController
   }

   private func setRxView() {
      viewModel.beforeWords
         .drive(beforeSearchWordTable.rx
                  .items(cellIdentifier: BeforeSearchTableCell.reuseCellName,
                         cellType: BeforeSearchTableCell.self)) { _, beforeData, cell in
            cell.wordText.text = beforeData.word
         }.disposed(by: disposeBag)

      beforeSearchWordTable.rx
         .modelSelected(BeforeKeywords.self)
         .asDriver()
         .drive(onNext: { (words) in
            let word = words.word
            self.searchController.isActive = true
            self.searchController.searchBar.text = word
            self.searchController.searchBar.delegate?.searchBarSearchButtonClicked?( self.searchController.searchBar)
         }).disposed(by: disposeBag)

      searchController.searchBar.rx
         .cancelButtonClicked
         .asDriver()
         .drive(onNext: {
            self.viewModel.isRefresh.accept(true)
         }, onDisposed: {
            self.viewModel.isRefresh.accept(false)
         })
         .disposed(by: disposeBag)
   }

   private func tableViewSetting() {
      beforeSearchWordTable.tableFooterView = UIView()
      beforeSearchWordTable.rowHeight = 44
   }
}
