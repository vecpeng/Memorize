//
//  MemorizeGame.swift
//  Memorize
//
//  Created by 陈鹏 on 2021/5/5.
//


import Foundation


/// Model for memory game
struct MemoryGame<CardContent> where CardContent: Equatable {
    /// Array containing all the cards in the game
    var cards: [Card]
    var score: Int = 0
    /// Record the index of the card already face up
    var theIndexOfOnlyCardFaceUp: Int? {
        get { cards.indices.filter { cards[$0].isFaceUp}.only }
        set {
            for index in cards.indices {
                if index == newValue {
                    cards[index].isFaceUp = true
                } else {
                    cards[index].isFaceUp = false
                }
            }
        }
    }
    /**
     Choose card from cards array
     - parameters:
        - card: The card to choose
     */
    mutating func choose(card: Card) {
        print("card chosen: \(card)")

        if let chosenIndex: Int = cards.firstIndex(matching: card), !cards[chosenIndex].isFaceUp, !cards[chosenIndex].isMatched {
            if let potentialIndex = theIndexOfOnlyCardFaceUp {
                if cards[chosenIndex].content == cards[potentialIndex].content {
                    print(chosenIndex)
                    score = score + 2
                    cards[chosenIndex].isMatched = true
                    cards[potentialIndex].isMatched = true
                } else {
                    score = score - 1
                }
            } else {
                theIndexOfOnlyCardFaceUp = chosenIndex
            }
            cards[chosenIndex].isFaceUp = true
        }
    }
    
    mutating func resetGame() {
        for index in cards.indices {
            cards[index].isMatched = false
            cards[index].isFaceUp = false
        }
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
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
    
}

