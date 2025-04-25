//
//  MemorizeGame.swift
//  MemorizeApp
//
//  Created by Lera Savchenko on 25.04.25.
//

import Foundation

struct MemorizeGame<CardContent> {
    
    var cards: Array<Card>
    
    func choose(card: Card) {
        
    }
    
    struct Card {
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent
    }
}
