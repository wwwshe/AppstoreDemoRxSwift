//
//  Common.swift
//  AppstoreDemoRxSwift
//
//  Created by jungwook on 2020/01/29.
//  Copyright © 2020 jungwook. All rights reserved.
//

import Foundation
import RealmSwift

final class Common {
    static let shared = Common()
       
    var userDefaults = UserDefaults.standard
    
    func setUserDefaultValue(key : String, value : Any){
        userDefaults.set(value, forKey: key)
    }
    func getUserDefaultValue<T>(key : String, type : T.Type) -> T?{
        guard let value = userDefaults.value(forKey: key) else{
            return nil
        }
        return value as? T
    }
    
    func getUserDefaultArrayValue<T>(key : String, type : T.Type) -> [T]?{
        
        guard let value = userDefaults.array(forKey: key) else{
            return nil
        }
        return value as? [T]
    }
    
    func setRealmData(){
        Realm.registerRealmables(BeforeKeywords.self)
    }
    
    
    
}
