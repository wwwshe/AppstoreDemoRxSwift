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
        self.layoutIfNeeded()
   
        screenShot1.layer.masksToBounds = true
        screenShot2.layer.masksToBounds = true
        screenShot3.layer.masksToBounds = true
        appIcon.layer.masksToBounds = true
        
        appIcon.layer.cornerRadius = 8
        screenShot1.layer.cornerRadius = 8
        screenShot2.layer.cornerRadius = 8
        screenShot3.layer.cornerRadius = 8
        
        appIcon.layer.borderWidth = 0.5
        screenShot1.layer.borderWidth = 0.5
        screenShot2.layer.borderWidth = 0.5
        screenShot3.layer.borderWidth = 0.5
        
        appIcon.layer.borderColor = UIColor.gray.cgColor
        screenShot1.layer.borderColor = UIColor.gray.cgColor
        screenShot2.layer.borderColor = UIColor.gray.cgColor
        screenShot3.layer.borderColor = UIColor.gray.cgColor
        
        installBtn.layer.masksToBounds = true
        installBtn.layer.cornerRadius = installBtn.frame.height / 2
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
