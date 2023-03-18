//
//  SearchListViewController.swift
//  AppstoreDemoRxSwift
//
//  Created by jungwook on 2020/01/29.
//  Copyright © 2020 jungwook. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import Kingfisher

final class SearchListViewController: ViewControllerHelper {

    @IBOutlet weak var beforeHistoryTableView: UITableView!
    @IBOutlet weak var searchListTable: UITableView!

    @IBOutlet weak var emptyView: UIView!
    @IBOutlet weak var emptySearchWord: UILabel!

    var viewModel = SearchListViewModel()
    private let disposeBag = DisposeBag()
    var searchText = BehaviorRelay(value: "")
    var isEmpty = BehaviorRelay(value: false)

    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewSetting()
        rxSetting()
    }

    private func tableViewSetting() {
        beforeHistoryTableView.tableFooterView = UIView()
        beforeHistoryTableView.rowHeight = 44
        searchListTable.tableFooterView = UIView()
        searchListTable.rowHeight = UITableView.automaticDimension
        searchListTable.estimatedRowHeight = 400
    }

    private func rxSetting() {
        viewModel.data
            .drive(searchListTable.rx.items(cellIdentifier: SearchResultTableViewCell.reuseCellName,
                                            cellType: SearchResultTableViewCell.self)) { _, result, cell in
                let imageUrl = URL(string: result.artworkUrl60)
                cell.appIcon.kf.setImage(with: imageUrl)
                cell.appName.text = result.trackName
                let genreText = result.genres.joined(separator: ", ")
                cell.genreText.text = genreText
                cell.ratingView.rating = result.averageUserRating ?? 0.0

                cell.ratingText.text = Common.shared.ratingCountToString(ratingCount: result.userRatingCount ?? 0)
                let screenshotUrl1 = URL(string: result.screenshotUrls[0])
                let screenshotUrl2 = URL(string: result.screenshotUrls[1])
                let screenshotUrl3 = URL(string: result.screenshotUrls[2])
                cell.screenShot1.kf.setImage(with: screenshotUrl1)
                cell.screenShot2.kf.setImage(with: screenshotUrl2)
                cell.screenShot3.kf.setImage(with: screenshotUrl3)
            }
                                            .disposed(by: disposeBag)

        viewModel.isEmpty
            .filter {$0}
            .asDriver(onErrorJustReturn: false)
            .drive(onNext: { [weak self] (isEmpty) in
                self?.emptyView.isHidden = !isEmpty
                self?.searchListTable.isHidden = isEmpty
            }).disposed(by: disposeBag)

        self.searchText
            .asDriver()
            .drive(onNext: { [weak self] (word) in
                self?.emptySearchWord.text = "'" + word + "'"
            }).disposed(by: disposeBag)

        viewModel.beforeWords
            .drive(beforeHistoryTableView.rx.items(cellIdentifier: SearchHistoryTableViewCell.reuseCellName,
                                                   cellType: SearchHistoryTableViewCell.self)) { _, beforeData, cell in
                cell.searchWord.text = beforeData.word
            }.disposed(by: disposeBag)

        beforeHistoryTableView.rx.modelSelected(BeforeKeywords.self)
            .asDriver()
            .drive(onNext: { [weak self] (words) in
                guard let self = self,
                      let searchController = self.parent as? UISearchController else {
                          return
                      }
                let word = words.word

                searchController.searchBar.text = word
                searchController.searchBar.delegate?.searchBarSearchButtonClicked?(searchController.searchBar)
            }).disposed(by: disposeBag)

        searchListTable.rx.modelSelected(AppstoreSearchResult.self)
            .asDriver()
            .drive(onNext: { [weak self] (result) in
                guard let self = self,
                      let controller = self.getViewController(target: AppDetailViewController.self),
                      let presentcontroller = self.presentingViewController,
                      let navi = presentcontroller.navigationController else {
                          return
                      }

                controller.resultData = result
                navi.pushViewController(controller, animated: true)
            }).disposed(by: disposeBag)
    }
}
