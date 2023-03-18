//
//  AppDetailViewController+Extension.swift
//  AppstoreDemoRxSwift
//
//  Created by jun wook on 2020/02/27.
//  Copyright © 2020 jungwook. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

extension AppDetailTableDataSource {
    func configTitleCell(table: UITableView, data: AppstoreSearchResult, atIndex: IndexPath) -> UITableViewCell {
        guard let cell = table.dequeueReusableCell(withIdentifier: AppDetailTitleTableViewCell.reuseCellName,
                                                   for: atIndex) as? AppDetailTitleTableViewCell else {
            return UITableViewCell()
        }

        let appIconUrl = URL(string: data.artworkUrl100)
        cell.appIcon.kf.setImage(with: appIconUrl)
        cell.appNameLabel.text = data.trackName
        cell.subTitleLabel.text = data.trackCensoredName

        cell.shareBtn.rx.tap.asDriver()
        .drive(onNext: { [weak self] in

            let activityVC = UIActivityViewController(activityItems: [data.trackViewURL], applicationActivities: nil)
          activityVC.excludedActivityTypes = [.airDrop]

            self?.parentViewcontroller?.present(activityVC, animated: true, completion: nil)

          activityVC.completionWithItemsHandler = { (_, _, _, _) in
          }

        }).disposed(by: cell.disposeBag)

        return cell
    }

    func configRatingCell(table: UITableView, data: AppstoreSearchResult, atIndex: IndexPath) -> UITableViewCell {
        guard let cell = table.dequeueReusableCell(withIdentifier: AppDetailRatingTableViewCell.reuseCellName,
                                                   for: atIndex) as? AppDetailRatingTableViewCell else {
            return UITableViewCell()
        }

        cell.ratingCountLabel.text = Common.shared.reviewRatingCountToString(ratingCount: data.userRatingCount ?? 0)
        cell.ratingView.rating = data.averageUserRating ?? 0.0
        cell.ratingText.text = Common.shared.floorDoubleToString(num: data.averageUserRating ?? 0.0, digit: 2)

        cell.ageLabel.text = data.trackContentRating
        cell.categoryLabel.text = data.genres.joined(separator: ", ")
        return cell
    }

    func configScreenShotCell(table: UITableView, data: AppstoreSearchResult, atIndex: IndexPath) -> UITableViewCell {
        guard let cell = table.dequeueReusableCell(withIdentifier: AppDetailScreenShotTableViewCell.reuseCellName,
                                                   for: atIndex) as? AppDetailScreenShotTableViewCell else {
            return UITableViewCell()
        }

        Observable.from(optional: data.screenshotUrls)
            .bind(to: cell.screenShotCollectionView.rx.items(cellIdentifier: ScreenShotCollectionViewCell.reuseCellName,
                                                             cellType: ScreenShotCollectionViewCell.self)) { _, data, cell in
            let screenshotUrl = URL(string: data)
            cell.imageView.kf.setImage(with: screenshotUrl)
        }.disposed(by: cell.disposeBag)

        return cell
    }

    func configUpdateHistoryCell(table: UITableView, data: AppstoreSearchResult, atIndex: IndexPath) -> UITableViewCell {
        guard let cell = table.dequeueReusableCell(withIdentifier: AppDetailUpdateContentTableViewCell.reuseCellName,
                                                   for: atIndex) as? AppDetailUpdateContentTableViewCell else {
            return UITableViewCell()
        }

        cell.agoDateLabel.text  = Common.shared.dateToAgoDateString(date: data.currentVersionReleaseDate)

        cell.versionLabel.text = "버전 \(data.version)"
        cell.contentLabel.text = data.releaseNotes

        cell.moreBtn.rx.tap.asDriver()
            .drive(onNext: { [weak self] in
                self?.isVersionExpand = true
                cell.contentLabel.numberOfLines = Int.max

                table.reloadData()

            }).disposed(by: cell.bag)

        if isVersionExpand || !cell.contentLabel.isTruncated {
            cell.contentLabel.numberOfLines = Int.max
            cell.moreBtn.isHidden = true
        }
        return cell
    }

    func configContentCell(table: UITableView, data: AppstoreSearchResult, atIndex: IndexPath) -> UITableViewCell {
        guard let cell = table.dequeueReusableCell(withIdentifier: AppDetailContentTableViewCell.reuseCellName,
                                                   for: atIndex) as? AppDetailContentTableViewCell else {
            return UITableViewCell()
        }
        cell.contentLabel.text = data.resultDescription

        cell.moreBtn.rx.tap.subscribe { _ in
            self.isDescriptionExpand = true
            cell.contentLabel.numberOfLines = Int.max
        }.disposed(by: cell.bag)

        cell.moreBtn.rx.tap.asDriver()
            .drive(onNext: { [weak self] in
                self?.isDescriptionExpand = true
                cell.contentLabel.numberOfLines = Int.max

                table.reloadData()

            }).disposed(by: cell.bag)

        if isDescriptionExpand || !cell.contentLabel.isTruncated {
            cell.contentLabel.numberOfLines = Int.max
            cell.moreBtn.isHidden = true
        }

        return cell
    }

    func configInfoCell(table: UITableView, data: AppstoreSearchResult, atIndex: IndexPath) -> UITableViewCell {
        guard let cell = table.dequeueReusableCell(withIdentifier: AppDetailInfoTableViewCell.reuseCellName,
                                                   for: atIndex) as? AppDetailInfoTableViewCell else {
            return UITableViewCell()
        }

        cell.infoTitleLabel.text = infoTitles[atIndex.row]
        cell.infoText.text = infoDateToString(data: data, row: atIndex.row)

        infoExpandView(cell: cell, data: data, row: atIndex.row)

        return cell
    }

    func infoExpandView(cell: AppDetailInfoTableViewCell, data: AppstoreSearchResult, row: Int) {
        let isExpand = isInfoCellExpands[row]
        cell.expandLabel.isHidden = !isExpand
        cell.infoText.isHidden = isExpand
        cell.expandTopPadding.constant = isExpand ? 7 : 0
        cell.expandBottomPadding.constant = isExpand ? 10 : 0
        cell.expandLabel.text = ""
        switch row {
        case 3:
            if isExpand {
                cell.expandLabel.text = data.supportedDevices.joined(separator: ", ")
                cell.expandBtn.isHidden = true
            } else {
                if data.supportedDevices.count > 2 {
                    cell.expandBtn.isHidden = false
                }
            }
        case 4:
            if isExpand {
                let list = data.languageCodesISO2A.map { (code) -> String in
                    return Common.shared.getLanguage(languageCode: code)
                }
                cell.expandLabel.text = list.joined(separator: ", ")
                cell.expandBtn.isHidden = true
            } else {
                if data.languageCodesISO2A.count > 2 {
                    cell.expandBtn.isHidden = false
                }
            }
        default:
            cell.expandBtn.isHidden = true
        }

    }

    func infoDateToString(data: AppstoreSearchResult, row: Int) -> String {
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
            if deviceName.contains("iPhone") {
                prefix = "이 iPhone와 "
            } else {
                if deviceName.contains("iPad") {
                    prefix = "이 iPad와 "
                } else {
                    prefix = "이 기기와 "
                }
            }
            if isSupport {
                prefix += "호환"
            } else {
                prefix += "호환 안됨"
            }
            return prefix
        case 4:
            //            let current = Locale.current.languageCode ?? ""
            let localeID = Locale.preferredLanguages.first
            let current = ((Locale(identifier: localeID!).languageCode)!).uppercased()

            if data.languageCodesISO2A.contains(current) {
                let lang = Common.shared.getLanguage(languageCode: current)
                if data.languageCodesISO2A.count > 1 {
                    return "\(lang) 외 \(data.languageCodesISO2A.count - 1)개"
                } else {
                    return "\(lang)"
                }
            } else {
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
