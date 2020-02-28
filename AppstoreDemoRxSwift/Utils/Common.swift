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
    func floorDoubleToString(num : Double, digit : Int) -> String{
        let numberFormatter = NumberFormatter()
        numberFormatter.roundingMode = .floor
        numberFormatter.minimumSignificantDigits = digit
        numberFormatter.maximumSignificantDigits = digit
        return numberFormatter.string(from: NSNumber(value: num)) ?? ""
    }
    
    
    func ratingCountToString(ratingCount : Int) -> String{
           guard ratingCount > 1000  else {
               return String(ratingCount)
           }
           let rating = Double(ratingCount)
           let numberFormatter = NumberFormatter()
           numberFormatter.roundingMode = .floor         // 형식을 버림으로 지정
           numberFormatter.minimumSignificantDigits = 2  // 자르길 원하는 자릿수
           numberFormatter.maximumSignificantDigits = 2
           
           if ratingCount > 10000{
               let div = rating / 10000.0
               let divString = numberFormatter.string(from: NSNumber(value: div))
               return divString! + "만"
           }else{
               let div = rating / 1000.0
               let divString = numberFormatter.string(from: NSNumber(value: div))
               return divString! + "천"
           }
       }
    func reviewRatingCountToString(ratingCount : Int) -> String{
         return "\(ratingCountToString(ratingCount: ratingCount))개의 평가"
    }
    
    func dateToAgoDateString(date : Date) -> String{
        let nowDate = Date()
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day,.hour], from: nowDate, to: date)
        let day = components.day ?? 0
        let hour = components.hour ?? 1
        
        let year =  day / 365
        let month = day / 30
        
        if  year > 0 {
            return "\(year)년 전"
        }else if month > 0 {
            return "\(month)달 전"
        }else if day > 0 {
            return "\(day)일 전"
        }else{
            return "\(hour)시간 전"
        }

    }
    
    func fileSizeToString(size : String) -> String{
        let bytes = Bytes(bytes: Int64(size) ?? 0)
        return bytes.getReadableUnit()
    }
    
    func deviceName() -> String {

        var systemInfo = utsname()
        uname(&systemInfo)

        guard let iOSDeviceModelsPath = Bundle.main.path(forResource: "iOSDeviceModelMapping", ofType: "plist") else { return "" }
        guard let iOSDevices = NSDictionary(contentsOfFile: iOSDeviceModelsPath) else { return "" }

        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }

        return iOSDevices.value(forKey: identifier) as! String
    }
    
    func getLanguage(languageCode : String) -> String {

        let locale = Locale(identifier: languageCode)
        return locale.localizedString(forLanguageCode: languageCode) ?? "Unknown"
    }
}
