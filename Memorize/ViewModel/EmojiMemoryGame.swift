//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by 陈鹏 on 2021/5/5.
//

import SwiftUI

/// View Model Class for emoji memory game
class EmojiMemoryGame: ObservableObject {
    var theme: ThemeCollection.Theme
    /// The  Model for emoji memory game
    @Published private var model: MemoryGame<String>
  
    init(theme: ThemeCollection.Theme) {
        self.theme = theme
        self.model = EmojiMemoryGame.createMemoryGame(theme: theme)
    }
    /// Create a new memory game model
    static func createMemoryGame(theme: ThemeCollection.Theme) -> MemoryGame<String> {
        return MemoryGame<String>(numberOfPairsOfCards: theme.emojis.count) { pairIndex in theme.emojis[pairIndex] }
    }
    
    // MARK: - Access to the Model
    
    /// Access the model's cards array
    var cards: [MemoryGame<String>.Card] { model.cards }
    // MARK: - Intent(s)
    var score: Int { model.score }
    /**
     Pass the choose card intent from view to model
     - Parameters:
        - card: the card to choose
     */
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
    
    func resetGame() {
        model.resetGame()
    }
}
