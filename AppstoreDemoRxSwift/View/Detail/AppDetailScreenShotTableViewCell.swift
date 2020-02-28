//
//  AppDetailScreenShotTableViewCell.swift
//  AppstoreDemoRxSwift
//
//  Created by jun wook on 2020/02/27.
//  Copyright © 2020 jungwook. All rights reserved.
//

import UIKit
import RxSwift

class AppDetailScreenShotTableViewCell: UITableViewCell {

    @IBOutlet weak var screenShotCollectionView: UICollectionView!
    
   private(set) var disposeBag = DisposeBag()

   override func prepareForReuse() {
      super.prepareForReuse()
      disposeBag = DisposeBag()
   }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func getScreenShotUrls(data : AppstoreSearchResult)->Observable<[String]>{
        return Observable.from(optional: data.screenshotUrls)
    }
    

}
