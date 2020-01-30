//
//  SearchViewModel.swift
//  AppstoreDemoRxSwift
//
//  Created by jungwook on 2020/01/29.
//  Copyright © 2020 jungwook. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class BeforeSearchViewModel{
   
    func getBeforeWords() -> Observable<[BeforeKeywords]>{
        let realmManager = RealmManager()
        let keywords = realmManager.allKeywords()
        return Observable.from(optional: keywords)
    }
    
}
