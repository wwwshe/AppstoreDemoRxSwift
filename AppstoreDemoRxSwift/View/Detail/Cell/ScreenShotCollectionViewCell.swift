//
//  ScreenShotCollectionViewCell.swift
//  AppstoreDemoRxSwift
//
//  Created by jun wook on 2020/02/28.
//  Copyright © 2020 jungwook. All rights reserved.
//

import UIKit

final class ScreenShotCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
    }
}
