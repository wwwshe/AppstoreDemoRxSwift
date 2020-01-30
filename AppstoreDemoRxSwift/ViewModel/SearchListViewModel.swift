//
//  SearchListViewModel.swift
//  AppstoreDemoRxSwift
//
//  Created by jungwook on 2020/01/29.
//  Copyright © 2020 jungwook. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class SearchListViewModel{
    var seachText = BehaviorRelay(value: "")
    var beforeSearchText = BehaviorRelay(value: "")
   
    var isEmpty = BehaviorRelay(value: false)
   
    
    
    lazy var data: Driver<[AppstoreSearchResult]> = {
        
        return  self.seachText.asObservable().throttle(.milliseconds(300), scheduler: MainScheduler.instance).distinctUntilChanged().flatMapLatest({ (word) -> Observable<[AppstoreSearchResult]> in
            return self.appstoreDataBy(word)
        }).asDriver(onErrorJustReturn: [])
    }()
    lazy var beforeWords: Driver<[BeforeKeywords]> = {
        
        return  self.beforeSearchText.asObservable().throttle(.milliseconds(300), scheduler: MainScheduler.instance).distinctUntilChanged().flatMapLatest({ (word) -> Observable<[BeforeKeywords]> in
            return self.getBeforeWords(word: word)
        }).asDriver(onErrorJustReturn: [])
    }()
    func appstoreDataBy(_ word: String) -> Observable<[AppstoreSearchResult]> {
        let urlString = String(format: "\(BASE_URL)\(SEARCH_URL)", word)
   
        guard !word.isEmpty,
            let url = URL(string : urlString.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed) ?? "") else {
            return Observable.just([])
        }
       
        return URLSession.shared.rx.json(url: url).retry(3).catchErrorJustReturn([]).map(parse)
    }
    func parse(json : Any) -> [AppstoreSearchResult]{
        guard json is [String : Any] else {
            return []
        }
        let dic = json as! [String : Any]
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: dic, options: .prettyPrinted)
            let appdata = try AppStoreData(data: jsonData)
            let results = appdata.results
            
            if results.count > 0 {
                isEmpty.accept(false)
            }else{
                isEmpty.accept(true)
            }
            return results
        } catch {
            print(error.localizedDescription)
            isEmpty.accept(true)
            return []
        }
    }
    
    func getBeforeWords(word : String) -> Observable<[BeforeKeywords]>{
        let realmManager = RealmManager()
        let keywords = realmManager.selectBeforeWords(word: word)
     
        return Observable.from(optional: keywords)
    }
}
