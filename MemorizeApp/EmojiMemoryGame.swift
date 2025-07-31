//
//  EmojiMemoryGame.swift
//  MemorizeApp
//
//  Created by Lera Savchenko on 25.04.25.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    

    
    private static func createMemoryGame(with theme: GameTheme) -> MemoryGame<String> {
         
        return MemoryGame(numberOfPairsOfCards: theme.numberOfPairsOfCards) { index in
            theme.selectedEmojiSet[index]
        }
    }
        
    // model
    @Published private var game: MemoryGame<String>
    @Published private(set) var currentTheme: GameTheme
    
    init(currentTheme: GameTheme) {
        let theme = GameTheme.randomTheme()
        self.currentTheme = theme
        self.game = EmojiMemoryGame.createMemoryGame(with: theme)
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
