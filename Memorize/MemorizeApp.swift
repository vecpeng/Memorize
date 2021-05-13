//
//  MemorizeApp.swift
//  Memorize
//
//  Created by 陈鹏 on 2021/5/5.
//

import SwiftUI

@main
struct MemorizeApp: App {
    var theme = ThemeCollection().themes[Int.random(in: 0..<6)]
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: EmojiMemoryGame(
                theme: theme
            )
            )
        }
    }
}
