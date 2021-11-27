//
//  UICollectionViewCell+Extension.swift
//  AppstoreDemoRxSwift
//
//  Created by jun wook on 2020/02/28.
//  Copyright © 2020 jungwook. All rights reserved.
//

import Foundation
import UIKit

extension UICollectionViewCell {
    static var reuseCellName: String {
        return "\(String(describing: self))"
    }
}
