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
final class RealmManager{
    static let shared = RealmManager()
    
    func setKeywordsData(data : String){
        let word = BeforeKeywords(word: data)
        let realm = try! Realm()
        do {
            try realm.write {
                realm.add(word, update: .all)
            }
        } catch  {
            print("error : \(error)")
        }
    }
    
    func allKeywords() -> [BeforeKeywords]{
        let realm = try! Realm()
        let objs = realm.objects(BeforeKeywords.self)
        return Array(objs)
    }
    
    func selectBeforeWords(word : String) -> [BeforeKeywords]{
        let realm = try! Realm()
        let obj = realm.objects(BeforeKeywords.self)
        let predicate = NSPredicate(format: "word contains[c] %@", word)
        let filterResult = obj.filter(predicate)

        if !filterResult.isEmpty{
            let stations = Array(filterResult)
            return stations
        }else{
            return []
        }
    }
 
}
