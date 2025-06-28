//
//  EmojiMemoryGame.swift
//  MemorizeApp
//
//  Created by Lera Savchenko on 25.04.25.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    
    private static let flagEmojis = ["🇬🇧", "🏴󠁧󠁢󠁥󠁮󠁧󠁿", "🏴󠁧󠁢󠁳󠁣󠁴󠁿", "🇩🇰", "🇺🇸", "🇨🇮", "🇨🇳", "🇳🇬", "🇫🇷", "🇸🇪"]
    
    private static func createMemoryGame() -> MemorizeGame<String> {
        return MemorizeGame(numberOfPairsOfCards: 8) { pairIndex in
            if flagEmojis.indices.contains(pairIndex) {
                return flagEmojis[pairIndex]
            } else {
                return "🤷‍♀️"
            }
        }
    }
        
    // model
    @Published private var game = createMemoryGame()
    
    var cards:Array<MemorizeGame<String>.Card> {
        return game.cards
    }
    
//     MARK: - Intents
    func shuffle() {
        game.shuffle()
    }
    
    func choose(_ card: MemorizeGame<String>.Card) {
        game.choose(card)
    }
    
}
