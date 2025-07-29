//
//  EmojiMemoryGame.swift
//  MemorizeApp
//
//  Created by Lera Savchenko on 25.04.25.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    
    private static let flagEmojis = ["🇬🇧", "🏴󠁧󠁢󠁥󠁮󠁧󠁿", "🏴󠁧󠁢󠁳󠁣󠁴󠁿", "🇩🇰", "🇺🇸", "🇨🇮", "🇨🇳", "🇳🇬", "🇫🇷", "🇸🇪"]
    
    private static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame(numberOfPairsOfCards: 8) { pairIndex in
            if flagEmojis.indices.contains(pairIndex) {
                return flagEmojis[pairIndex]
            } else { 
                return "🌚"
            }
        }
    }
        
    // model
    @Published private var game = createMemoryGame()
    private(set) var theme: GameTheme<String>
    
    init() {
        self.theme = GameTheme.set()
        
    }
    

    
    var cards:Array<MemoryGame<String>.Card> {
        return game.cards
    }
    
//     MARK: - Intents
    func shuffle() {
        game.shuffle()
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        game.choose(card)
    }
    
}
