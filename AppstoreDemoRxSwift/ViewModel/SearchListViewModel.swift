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

final class SearchListViewModel {
    /// 검색어
    var seachText = BehaviorRelay(value: "")
    /// 이전 검색어
    var beforeSearchText = BehaviorRelay(value: "")
    var isEmpty = BehaviorRelay(value: false)

    lazy var data: Driver<[AppstoreSearchResult]> = {
        return self.seachText.asObservable()
            .throttle(.milliseconds(300), scheduler: MainScheduler.instance)
            .distinctUntilChanged()
            .flatMapLatest({ (word) -> Observable<[AppstoreSearchResult]> in
                return self.appstoreDataBy(word)
            }).asDriver(onErrorJustReturn: [])
    }()

    lazy var beforeWords: Driver<[BeforeKeywords]> = {
        return self.beforeSearchText.asObservable()
            .throttle(.milliseconds(300), scheduler: MainScheduler.instance)
            .distinctUntilChanged()
            .flatMapLatest({ (word) -> Observable<[BeforeKeywords]> in
                return self.getBeforeWords(word: word)
            }).asDriver(onErrorJustReturn: [])
    }()

    func appstoreDataBy(_ word: String) -> Observable<[AppstoreSearchResult]> {
        let urlString = String(format: "\(BASE_URL)\(SEARCH_URL)", word)

        guard !word.isEmpty,
              let urlString = urlString.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed),
              let url = URL(string: urlString) else {
                  return Observable.just([])
              }

        return URLSession.shared.rx.json(url: url).retry(3).catchAndReturn([]).map(parse)
    }

    func parse(json: Any) -> [AppstoreSearchResult] {
        guard json is [String: Any] else {
            return []
        }

        do {
            let jsonData = try JSONSerialization.data(withJSONObject: json, options: .prettyPrinted)
            let appdata = try AppStoreData(data: jsonData)
            let results = appdata.results

            if results.count > 0 {
                isEmpty.accept(false)
            } else {
                isEmpty.accept(true)
            }
            return results
        } catch {
            isEmpty.accept(true)
            return []
        }
    }

    func getBeforeWords(word: String) -> Observable<[BeforeKeywords]> {
        let realmManager = RealmManager.shared
        let keywords = realmManager.selectBeforeWords(word: word)
        return Observable.from(optional: keywords)
    }
}
