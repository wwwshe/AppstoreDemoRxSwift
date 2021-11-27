//
//  AppDetailTitleTableViewCell.swift
//  AppstoreDemoRxSwift
//
//  Created by jun wook on 2020/02/27.
//  Copyright © 2020 jungwook. All rights reserved.
//

import UIKit
import RxSwift

final class AppDetailTitleTableViewCell: UITableViewCell {

    @IBOutlet weak var appIcon: UIImageView!

    @IBOutlet weak var appNameLabel: UILabel!

    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var installBtn: UIButton!
    @IBOutlet weak var shareBtn: UIButton!

    private(set) var disposeBag = DisposeBag()

    override func prepareForReuse() {
        super.prepareForReuse()
        disposeBag = DisposeBag()
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

        installBtn.layer.masksToBounds = true
        installBtn.layer.cornerRadius = installBtn.frame.height / 2

        appIcon.layer.cornerRadius = 10
        appIcon.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
