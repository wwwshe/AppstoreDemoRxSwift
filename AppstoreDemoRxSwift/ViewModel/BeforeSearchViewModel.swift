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
  
    var isRefresh = BehaviorRelay(value: false)
    lazy var beforeWords: Driver<[BeforeKeywords]> = {
       
       return  self.isRefresh.asObservable().throttle(.milliseconds(300), scheduler: MainScheduler.instance).distinctUntilChanged().flatMapLatest({ (word) -> Observable<[BeforeKeywords]> in
           return self.getBeforeWords()
       }).asDriver(onErrorJustReturn: [])
   }()
    
    func getBeforeWords() -> Observable<[BeforeKeywords]>{
        let realmManager = RealmManager.shared
        let keywords = realmManager.allKeywords()
      
        return Observable.from(optional: keywords)
    }
    
}
