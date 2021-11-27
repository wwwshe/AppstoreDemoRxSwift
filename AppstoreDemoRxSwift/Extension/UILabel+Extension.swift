//
//  UILabel+Extension.swift
//  AppstoreDemoRxSwift
//
//  Created by jun wook on 2020/02/28.
//  Copyright © 2020 jungwook. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {
    func countLabelLines() -> Int {
        // Call self.layoutIfNeeded() if your view is uses auto layout
        let myText = self.text! as NSString
        let attributes = [NSAttributedString.Key.font: self.font]
        let size = CGSize(width: self.bounds.width, height: CGFloat.greatestFiniteMagnitude)
        let labelSize = myText.boundingRect(with: size,
                                            options: .usesLineFragmentOrigin,
                                            attributes: attributes as [NSAttributedString.Key: Any],
                                            context: nil)
        return Int(ceil(CGFloat(labelSize.height) / self.font.lineHeight))
    }

    var isTruncated: Bool {
        guard let labelText = text else { return false }
        let attributes = [NSAttributedString.Key.font: self.font]
        let labelTextSize = (labelText as NSString).boundingRect(
            with: CGSize(width: frame.size.width, height: .greatestFiniteMagnitude),
            options: .usesLineFragmentOrigin,
            attributes: attributes as [NSAttributedString.Key: Any],
            context: nil).size
        return labelTextSize.height > bounds.size.height
    }
}
