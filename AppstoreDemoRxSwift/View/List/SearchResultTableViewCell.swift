//
//  SearchResultTableViewCell.swift
//  AppstoreDemoRxSwift
//
//  Created by jungwook on 2020/01/29.
//  Copyright © 2020 jungwook. All rights reserved.
//

import UIKit
import FloatRatingView

class SearchResultTableViewCell: UITableViewCell {
    @IBOutlet weak var appIcon: UIImageView!
    @IBOutlet weak var appName: UILabel!
    @IBOutlet weak var installBtn: UIButton!
    @IBOutlet weak var genreText: UILabel!
    
    @IBOutlet weak var screenShot3: UIImageView!
    @IBOutlet weak var screenShot2: UIImageView!
    @IBOutlet weak var screenShot1: UIImageView!
    @IBOutlet weak var ratingText: UILabel!
    @IBOutlet weak var ratingView: FloatRatingView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
