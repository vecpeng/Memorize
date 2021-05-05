//
//  ContentView.swift
//  Memorize
//
//  Created by 陈鹏 on 2021/5/5.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    /// View Model for the emoji memory game
    var viewModel: EmojiMemoryGame
    
    var body: some View {
        HStack{
            ForEach(viewModel.cards) { card in
                CardView(card: card).onTapGesture {
                    viewModel.choose(card: card)
                }
            }
        }
        .padding()
        .foregroundColor(.orange)
        .font(viewModel.cards.count == 10 ? .title : .largeTitle)
    }
}


/// A structure that construct view for a card
struct CardView: View {
    /// The card for view
    var card: MemoryGame<String>.Card
    
    var body: some View {
        if card.isFaceUp {
            ZStack{
                RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
                RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3)
                Text(card.content)
            }
        } else {
            RoundedRectangle(cornerRadius: 10.0).fill()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}
