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
    
    var score: Int {
        game.score
    }
    
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
    
    func startNewGame() {
        let newTheme = GameTheme.randomTheme()
        currentTheme = newTheme
        game = EmojiMemoryGame.createMemoryGame(with: newTheme)
    }
    
    func setThemeColor() -> SwiftUI.Color {
        let themeColor = currentTheme.themeColor
        
        switch themeColor {
        case "orange":
            return .orange
        case "yellow":
            return .yellow
        case "blue":
            return .blue
        case "purple":
            return .purple
        case "green":
            return .green
        case "pink":
            return .pink
        default:
            return .red
        }
    }
    
}
