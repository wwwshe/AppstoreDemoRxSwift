//
//  AppDetailViewController+Extension.swift
//  AppstoreDemoRxSwift
//
//  Created by jun wook on 2020/02/27.
//  Copyright © 2020 jungwook. All rights reserved.
//

import Foundation
import UIKit

extension AppDetailTableDataSource{
    func configTitleCell(table : UITableView, data: AppstoreSearchResult, atIndex: IndexPath) -> UITableViewCell {
        guard let cell = table.dequeueReusableCell(withIdentifier: AppDetailTitleTableViewCell.reuseCellName, for: atIndex) as? AppDetailTitleTableViewCell else {
            return UITableViewCell()
        }
        let appIconUrl = URL(string : data.artworkUrl100)
        cell.appIcon.kf.setImage(with: appIconUrl)
        cell.appNameLabel.text = data.trackName
        cell.subTitleLabel.text = data.trackCensoredName
        
        return cell
    }
    
    func configRatingCell(table : UITableView, data: AppstoreSearchResult, atIndex: IndexPath) -> UITableViewCell {
        guard let cell = table.dequeueReusableCell(withIdentifier: AppDetailRatingTableViewCell.reuseCellName, for: atIndex) as? AppDetailRatingTableViewCell else {
            return UITableViewCell()
        }
        cell.ratingText.text = Common.shared.reviewRatingCountToString(ratingCount: data.userRatingCount ?? 0)
        cell.ratingView.rating = data.averageUserRating ?? 0.0
        
        cell.ageLabel.text = data.trackContentRating
        cell.categoryLabel.text = data.genres.joined(separator: ", ")
        return cell
    }
    
    
    func configScreenShotCell(table : UITableView, data: AppstoreSearchResult, atIndex: IndexPath) -> UITableViewCell {
        guard let cell = table.dequeueReusableCell(withIdentifier: AppDetailScreenShotTableViewCell.reuseCellName, for: atIndex) as? AppDetailScreenShotTableViewCell else {
            return UITableViewCell()
        }
        
       
        return cell
    }
    
    func configUpdateHistoryCell(table : UITableView, data: AppstoreSearchResult, atIndex: IndexPath) -> UITableViewCell {
        guard let cell = table.dequeueReusableCell(withIdentifier: AppDetailUpdateContentTableViewCell.reuseCellName, for: atIndex) as? AppDetailUpdateContentTableViewCell else {
            return UITableViewCell()
        }
        cell.agoDateLabel.text  = Common.shared.dateToAgoDateString(date: data.currentVersionReleaseDate)
        
        cell.versionLabel.text = "버전 \(data.version)"
        cell.contentLabel.text = data.releaseNotes
        
        return cell
    }
    
    func configContentCell(table : UITableView, data: AppstoreSearchResult, atIndex: IndexPath) -> UITableViewCell {
        guard let cell = table.dequeueReusableCell(withIdentifier: AppDetailContentTableViewCell.reuseCellName, for: atIndex) as? AppDetailContentTableViewCell else {
            return UITableViewCell()
        }
        cell.contentLabel.text = data.resultDescription
        
       
        return cell
    }
    
     func configInfoCell(table : UITableView, data: AppstoreSearchResult, atIndex: IndexPath) -> UITableViewCell {
         guard let cell = table.dequeueReusableCell(withIdentifier: AppDetailInfoTableViewCell.reuseCellName, for: atIndex) as? AppDetailInfoTableViewCell else {
             return UITableViewCell()
         }
      
        cell.infoTitleLabel.text = infoTitles[atIndex.row]
        cell.infoText.text = infoDateToString(data: data, row: atIndex.row)
        
         return cell
     }
    func infoDateToString(data : AppstoreSearchResult, row : Int) -> String{
        switch row {
        case 0:
            return data.artistName
        case 1:
            return Common.shared.fileSizeToString(size: data.fileSizeBytes)
        case 2:
            return data.genres[0]
        case 3:
            let deviceName = Common.shared.deviceName()
            let isSupport = data.supportedDevices.contains(deviceName)
            var prefix = ""
            if deviceName.contains("iPhone"){
                prefix = "이 iPhone와"
            }else{
                prefix = "이 iPad와"
            }
            if isSupport{
                prefix += "호환"
            }else{
                prefix += "호환 안됨"
            }
            return prefix
        case 4:
            let current = Locale.current.languageCode ?? ""
            if data.languageCodesISO2A.contains(current){
                let lang = Common.shared.getLanguage(languageCode: current)
                if data.languageCodesISO2A.count > 1{
                    return "\(lang) 외 \(data.languageCodesISO2A.count - 1)개"
                }else{
                    return "\(lang)"
                }
            }else{
                return "현재 기기 지원 안됨"
            }
        case 5:
            return data.trackContentRating
        case 6:
            return data.sellerName
        default:
            return ""
        }
    }
    
}
