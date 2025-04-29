//
//  EmojiMemoryGame.swift
//  MemorizeApp
//
//  Created by Lera Savchenko on 25.04.25.
//

import SwiftUI

class EmojiMemoryGame {
    
    private static let flagEmojis = ["🇬🇧", "🏴󠁧󠁢󠁥󠁮󠁧󠁿", "🏴󠁧󠁢󠁳󠁣󠁴󠁿", "🇩🇰", "🇺🇸", "🇨🇮", "🇨🇳", "🇳🇬", "🇫🇷", "🇸🇪"]
    
    private static func createMemoryGame() -> MemorizeGame<String> {
        return MemorizeGame(numberOfPairsOfCards: 4) { pairIndex in
            if flagEmojis.indices.contains(pairIndex) {
                return flagEmojis[pairIndex]
            } else {
                return "🤷‍♀️"
            }
        }
    }
    
    // model
    private var game = createMemoryGame()
    
    var cards:Array<MemorizeGame<String>.Card> {
        return game.cards
    }
    
    func choose(_ card: MemorizeGame<String>.Card) {
        game.choose(card)
    }
    
}
