//
//  RealmManager.swift
//  DDota
//
//  Created by jungwook on 2019/12/10.
//  Copyright © 2019 jungwook. All rights reserved.
//

import Foundation
import RealmSwift

/// Realm 객체
final class RealmManager {
    static let shared = RealmManager()

    func setKeywordsData(data: String) {
        guard let realm = try? Realm() else {
            return
        }

        let word = BeforeKeywords(word: data)

        do {
            try realm.write {
                realm.add(word, update: .all)
            }
        } catch {
            print("error : \(error)")
        }
    }

    func allKeywords() -> [BeforeKeywords] {
        guard let realm = try? Realm() else {
            return []
        }

        let objs = realm.objects(BeforeKeywords.self)
        return Array(objs)
    }

    func selectBeforeWords(word: String) -> [BeforeKeywords] {
        guard let realm = try? Realm() else {
            return []
        }

        let obj = realm.objects(BeforeKeywords.self)
        let predicate = NSPredicate(format: "word contains[c] %@", word)
        let filterResult = obj.filter(predicate)

        if !filterResult.isEmpty {
            let stations = Array(filterResult)
            return stations
        } else {
            return []
        }
    }
}
