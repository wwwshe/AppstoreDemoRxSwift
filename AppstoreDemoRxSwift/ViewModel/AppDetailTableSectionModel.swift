//
//  SectionModel.swift
//  AppstoreDemoRxSwift
//
//  Created by jun wook on 2020/02/27.
//  Copyright © 2020 jungwook. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import RxDataSources

typealias SectionOfAppDetail = SectionModel<AppDetailTableSectionModel, DetailSectionItem>

enum AppDetailTableSectionModel {
    case detail
}

enum DetailSectionItem {
    case title(info: AppstoreSearchResult)
    case rating(info: AppstoreSearchResult)
    case screenShot(info: AppstoreSearchResult)
    case updateHistory(info: AppstoreSearchResult)
    case content(info: AppstoreSearchResult)
}
