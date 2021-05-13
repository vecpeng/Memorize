//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by 陈鹏 on 2021/5/5.
//

import SwiftUI

/// View Model Class for emoji memory game
class EmojiMemoryGame: ObservableObject {
    /// The  Model for emoji memory game
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    /// Create a new memory game model
    static func createMemoryGame() -> MemoryGame<String> {
        var emojis = ["👻", "💀", "🎃", "🐯", "🐸"]
        emojis = Array(emojis.shuffled()[0...Int.random(in: 1...4)])
        return MemoryGame<String>(numberOfPairsOfCards: emojis.count) { pairIndex in emojis[pairIndex] }
    }
    
    // MARK: - Access to the Model
    
    /// Access the model's cards array
    var cards: [MemoryGame<String>.Card] { model.cards }
    
    // MARK: - Intent(s)
    
    /**
     Pass the choose card intent from view to model
     - Parameters:
        - card: the card to choose
     */
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
}
