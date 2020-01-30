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

class BeforeSearchViewController: ViewControllerHelper {
   @IBOutlet weak var beforeSearchWordTable: UITableView!
   
   var viewModel = BeforeSearchViewModel()
   let disposeBag = DisposeBag()
   
   var listController : SearchListViewController!
   var searchController : UISearchController!
   override func viewDidLoad() {
      super.viewDidLoad()
      listController =  self.getViewController(target: SearchListViewController.self)
      searchController = UISearchController(searchResultsController: listController)
      searchController.searchResultsUpdater = listController
      searchController.searchBar.delegate = listController
      searchController.obscuresBackgroundDuringPresentation = false
      
      tableViewSetting()
  
      self.navigationItem.searchController = searchController
  

   }
   
   override func viewDidAppear(_ animated: Bool) {
      super.viewDidAppear(animated)
      viewModel.getBeforeWords().bind(to: beforeSearchWordTable.rx.items(cellIdentifier: BeforeSearchTableCell.reuseCellName, cellType: BeforeSearchTableCell.self)){ _, beforeData, cell in
         
         cell.wordText.text = beforeData.word
         
      }.disposed(by: disposeBag)
   }
   
   
   func tableViewSetting(){
      beforeSearchWordTable.tableFooterView = UIView()
      beforeSearchWordTable.rowHeight = 44
   }
   
   
   /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    // Get the new view controller using segue.destination.
    // Pass the selected object to the new view controller.
    }
    */
   
}
