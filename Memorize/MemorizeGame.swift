//
//  MemorizeGame.swift
//  Memorize
//
//  Created by 陈鹏 on 2021/5/5.
//


import Foundation


/// Model for memory game
struct MemoryGame<CardContent> {
    /// Array containing all the cards in the game
    var cards: [Card]
    
    /**
     Choose card from cards array
     - parameters:
        - card: The card to choose
     */
    mutating func choose(card: Card) {
        print("card chosen: \(card)")
        let chosenIndex: Int = cards.firstIndex(matching: card) ?? 0
        self.cards[chosenIndex].isFaceUp = !self.cards[chosenIndex].isFaceUp
    }
    
    /**
     Initialize the memory game
     - parameters:
        - numberOfPairsOfCards: The number of pairs of cards to be initialized
        - cardContentFactory: The function that takes Integer as input and output CardContent
     */
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = [Card]()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
    }
    
    /// Single card for memory game
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMathed: Bool = false
        var content: CardContent
        var id: Int
    }
}

