//
//  Array+Only.swift
//  Memorize
//
//  Created by 陈鹏 on 2021/5/13.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
