//
//  MemoryGame.swift
//  Memorize
//
//  Created by Mario D Portillo on 5/28/21.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards: Array<Card>
    
    private var indexOFTheOneAndOnlyFaceUpCard: Int?
    
    mutating func choose(_ card: Card) {
//        if let chosenIndex = index(of: card) {
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }),
           !cards[chosenIndex].isFaceUp,
           !cards[chosenIndex].isMatched
        {
            if let potentialMatchIndex = indexOFTheOneAndOnlyFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                    indexOFTheOneAndOnlyFaceUpCard = nil
                }else{
                    for index in cards.indices {
                        cards[index].isFaceUp = false
                    }
                    indexOFTheOneAndOnlyFaceUpCard = chosenIndex
                }
            cards[chosenIndex].isFaceUp.toggle()
        }
        
        print("\(cards)")
        
    }
//    func index(of card: Card) -> Int? {
//        for index in 0..<cards.count {
//            if cards[index].id == card.id {
//                return index
//            }
//        }
//        return nil
//    }
// Code above replaced by lines 15 and 16.
    

    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent){
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
        cards.shuffle()
    }
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent //Don't Care variable.
        var id: Int
    }
}
