//
//  SearchHistoryTableViewCell.swift
//  AppstoreDemoRxSwift
//
//  Created by jungwook on 2020/01/30.
//  Copyright © 2020 jungwook. All rights reserved.
//

import UIKit

final class SearchHistoryTableViewCell: UITableViewCell {

    @IBOutlet weak var searchWord: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
