//
//  BeforeKeywords.swift
//  AppstoreDemoRxSwift
//
//  Created by jungwook on 2020/01/30.
//  Copyright © 2020 jungwook. All rights reserved.
//

import Foundation
import Unrealm

struct BeforeKeywords: Realmable {
    var word: String = ""

    static func primaryKey() -> String? {
        return "word"
    }
}
