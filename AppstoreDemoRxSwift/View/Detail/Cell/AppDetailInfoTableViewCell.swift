//
//  AppDetailProviderTableViewCell.swift
//  AppstoreDemoRxSwift
//
//  Created by jun wook on 2020/02/27.
//  Copyright © 2020 jungwook. All rights reserved.
//

import UIKit
import RxSwift

final class AppDetailInfoTableViewCell: UITableViewCell {

    @IBOutlet weak var infoTitleLabel: UILabel!
    @IBOutlet weak var infoText: UILabel!
    @IBOutlet weak var expandBtn: UIButton!
    @IBOutlet weak var expandLabel: UILabel!

    @IBOutlet weak var expandTopPadding: NSLayoutConstraint!
    @IBOutlet weak var expandBottomPadding: NSLayoutConstraint!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
