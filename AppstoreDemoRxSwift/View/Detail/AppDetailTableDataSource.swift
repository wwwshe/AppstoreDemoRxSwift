//
//  AppDetailTableDataSource.swift
//  AppstoreDemoRxSwift
//
//  Created by jun wook on 2020/02/27.
//  Copyright © 2020 jungwook. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import UIKit

final class AppDetailTableDataSource :  NSObject, RxTableViewDataSourceType, UITableViewDataSource{
    typealias Element = AppstoreSearchResult
    var appData : AppstoreSearchResult? = nil
    
    var infoTitles = ["제공자","크기","카테고리","호완성","언어","연령 등급","저작권"]
    
    func tableView(_ tableView: UITableView, observedEvent: Event<AppstoreSearchResult>) {
        Binder(self) { dataSource, element in
            dataSource.appData = element
            tableView.reloadData()
        }
        .on(observedEvent)
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 1
        case 2:
            return 1
        case 3:
            return 1
        case 4:
            return 1
        case 5:
            return 7
        default:
            return 0
        }
    }
  
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let data = appData else{
            return UITableViewCell()
        }
        
        switch indexPath.section {
        case 0:
            
            return self.configTitleCell(table: tableView, data: data, atIndex: indexPath)
        case 1:
            return self.configRatingCell(table: tableView, data: data, atIndex: indexPath)
        case 2:
            return self.configScreenShotCell(table: tableView, data: data, atIndex: indexPath)
        case 3:
            return self.configContentCell(table: tableView, data: data, atIndex: indexPath)
        case 4:
            return self.configUpdateHistoryCell(table: tableView, data: data, atIndex: indexPath)
        case 5:
            return self.configInfoCell(table: tableView, data: data, atIndex: indexPath)
        default:
            return UITableViewCell()
        }
    }
}
