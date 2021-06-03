//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Mario D Portillo on 5/28/21.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject{
//    var model: MemoryGame<String> This is open to be manipulated in all Views(easy access)
//    private var model: MemoryGame<String> Conceals Var to only this View
//    private(set) var model: MemoryGame<String> Glass Door, other views can view
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    static func createMemoryGame() -> MemoryGame<String> {
        let emojis = ["👻","🎃","🕷","🤡","☠️","👹"]
        return MemoryGame<String>(numberOfPairsOfCards: emojis.count) { pairIndex in
            return emojis[pairIndex]
        }
    }
        
    
    //MARK: - Access to the Model
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    // MARK: - Intent(s)
    
    func choose(_ card: MemoryGame<String>.Card){
        model.choose(card)
    }
}
