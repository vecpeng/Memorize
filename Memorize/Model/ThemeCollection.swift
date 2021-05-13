//
//  ThemeCollection.swift
//  Memorize
//
//  Created by 陈鹏 on 2021/5/13.
//

import Foundation
import SwiftUI

struct ThemeCollection {
    var themes = [Theme]()
    struct Theme {
        var name: String
        var emojis: [String]
        var color: UIColor
        var number: Int = Int.random(in: 2...5)
        
        init(name: String, emojis: [String], color: UIColor, number: Int) {
            self.name = name
            self.emojis = emojis
            self.color = color
            self.number = number
        }
    }
    
    init() {
        themes = [DefaultThemes.theme0, DefaultThemes.theme1, DefaultThemes.theme2, DefaultThemes.theme3,
                  DefaultThemes.theme4, DefaultThemes.theme5]
    }
    
    mutating func addTheme(theme: Theme) {
        themes.append(theme)
    }
}
