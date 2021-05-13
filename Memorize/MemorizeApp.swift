//
//  MemorizeApp.swift
//  Memorize
//
//  Created by 陈鹏 on 2021/5/5.
//

import SwiftUI

@main
struct MemorizeApp: App {
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: EmojiMemoryGame())
        }
    }
}
