//
//  SearchListViewController+Extension.swift
//  AppstoreDemoRxSwift
//
//  Created by jungwook on 2020/01/29.
//  Copyright © 2020 jungwook. All rights reserved.
//

import Foundation
import UIKit
import RxCocoa
import RxSwift

extension SearchListViewController : UISearchResultsUpdating, UISearchBarDelegate{
    func updateSearchResults(for searchController: UISearchController) {
        let text = searchController.searchBar.text!
        guard text != "" else {
            searchListTable.isHidden = true
            beforeHistoryTableView.isHidden = true
            return
        }
        self.viewModel.beforeSearchText.accept(text)
        self.searchListTable.isHidden = true
        self.beforeHistoryTableView.isHidden = false
    }
    
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("searchBar Click")
        let realmManger = RealmManager()
        realmManger.setKeywordsData(data: searchBar.text!)
        self.viewModel.seachText.accept(searchBar.text!)
        self.searchListTable.isHidden = false
        self.beforeHistoryTableView.isHidden = true
        
      
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        
    }
    
    
}
