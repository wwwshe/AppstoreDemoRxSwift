//
//  SearchListViewController.swift
//  AppstoreDemoRxSwift
//
//  Created by jungwook on 2020/01/29.
//  Copyright © 2020 jungwook. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import Kingfisher

class SearchListViewController: UIViewController {
    
    @IBOutlet weak var beforeHistoryTableView: UITableView!
    @IBOutlet weak var searchListTable: UITableView!
    
    @IBOutlet weak var emptyView: UIView!
    @IBOutlet weak var emptySearchWord: UILabel!
    
    
    var viewModel = SearchListViewModel()
    let disposeBag = DisposeBag()
    var searchText = BehaviorRelay(value: "")
    var isEmpty = BehaviorRelay(value: false)
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewSetting()
        rxSetting()
    }
    
    func tableViewSetting(){
        beforeHistoryTableView.tableFooterView = UIView()
        beforeHistoryTableView.rowHeight = 44
        searchListTable.tableFooterView = UIView()
        searchListTable.rowHeight = UITableView.automaticDimension
        
        searchListTable.layer.borderColor = UIColor.red.cgColor
        searchListTable.layer.borderWidth = 2
    }
    
    func rxSetting(){
        viewModel.data.drive(searchListTable.rx.items(cellIdentifier: SearchResultTableViewCell.reuseCellName, cellType: SearchResultTableViewCell.self)){ _, result, cell in
            let imageUrl = URL(string : result.screenshotUrls[0])
            cell.appIcon.kf.setImage(with: imageUrl)
        }
        .disposed(by: disposeBag)
        viewModel.isEmpty.filter{$0}.subscribe(onNext: { (isEmpty) in
            DispatchQueue.main.async {
                self.emptyView.isHidden = !isEmpty
                self.searchListTable.isHidden = isEmpty
            }
            
            }).disposed(by: disposeBag)
    
        viewModel.beforeWords.drive(beforeHistoryTableView.rx.items(cellIdentifier: SearchHistoryTableViewCell.reuseCellName, cellType: SearchHistoryTableViewCell.self)){ _, beforeData, cell in
            cell.searchWord.text = beforeData.word
        }.disposed(by: disposeBag)
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
