//
//  MemoryGame.swift
//  MemorizeApp
//
//  Created by Lera Savchenko on 25.04.25.
//

import Foundation

struct MemoryGame<CardContent>  where CardContent: Equatable {
    
    private(set) var cards: Array<Card>
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = []
        // add numberOfPairsOfCards x 2 cards
        for pairIndex in 0..<max(2, numberOfPairsOfCards) {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: "\(pairIndex+1)a"))
            cards.append(Card(content: content, id: "\(pairIndex+2)b"))
        }
    }
    
    var indexOfSingleFaceUpCard: Int? 
    
    mutating func choose(_ card: Card) {
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id}) {
            if !cards[chosenIndex].isFaceUp && !cards[chosenIndex].isMatched {
                if let potentialMatchIndex = indexOfSingleFaceUpCard {
                    if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                        cards[chosenIndex].isMatched = true
                        cards[potentialMatchIndex].isMatched = true
                    }
                    indexOfSingleFaceUpCard = nil
                } else {
                    for index in cards.indices {
                        cards[index].isFaceUp = false
                    }
                    indexOfSingleFaceUpCard = chosenIndex
                }
                cards[chosenIndex].isFaceUp.toggle()
            }

        }
    }
    
    mutating func shuffle() {
        cards.shuffle()
        print(cards)
    }
    
    struct Card: Equatable, Identifiable, CustomStringConvertible {

        var isFaceUp = false
        var isMatched = false
        let content: CardContent
        
        var id: String
        var description: String {
            "\(id): \(content) \(isFaceUp ? "up" : "down")\(isMatched ? "matched" : "" )"
        }
    }
}
