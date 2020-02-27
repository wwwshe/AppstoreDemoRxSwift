//
//  AppDetailViewModel.swift
//  AppstoreDemoRxSwift
//
//  Created by jun wook on 2020/02/27.
//  Copyright © 2020 jungwook. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class AppDetailViewModel{
    var item : AppstoreSearchResult? = nil
    
    func getItem() -> Observable<AppstoreSearchResult>{
        return Observable.from(optional: item)
    }
}
