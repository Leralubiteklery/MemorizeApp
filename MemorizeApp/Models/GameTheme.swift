//
//  GameTheme.swift
//  MemorizeApp
//
//  Created by Lera Savchenko on 19.07.25.
//

import Foundation

struct GameTheme {
    
    let name: String
    let numberOfPairsOfCards: Int
    let selectedEmojiSet: [String]
    let themeColor: String
    
    static let allThemes: [GameTheme] = [
        GameTheme(
            name: "Flags",
            selectedEmojiSet: ["🇬🇧", "🏴󠁧󠁢󠁥󠁮󠁧󠁿", "🏴󠁧󠁢󠁳󠁣󠁴󠁿", "🇩🇰", "🇺🇸", "🇨🇮", "🇨🇳", "🇳🇬", "🇫🇷", "🇸🇪"],
            themeColor: "blue"
        ),
        GameTheme(
            name: "Animals",
            selectedEmojiSet: ["🐢", "🐰", "🐶", "🐸", "🐈", "🐷", "🐼", "🦔", "🐄", "🐀"],
            themeColor: "orange"
        ),
        GameTheme(
            name: "Flags",
            selectedEmojiSet: ["🇬🇧", "🏴󠁧󠁢󠁥󠁮󠁧󠁿", "🏴󠁧󠁢󠁳󠁣󠁴󠁿", "🇩🇰", "🇺🇸", "🇨🇮", "🇨🇳", "🇳🇬", "🇫🇷", "🇸🇪"],
            themeColor: "blue"
        ),
        GameTheme(
            name: "Gestures",
            selectedEmojiSet: ["🤲", "👐", "🙌", "👏", "🤝", "👍", "👎", "✊", "✌️", "🤟"],
            themeColor: "yellow"
        ),
        GameTheme(
            name: "Plants",
            selectedEmojiSet: ["☘️", "🌵", "🌴", "🌼", "🌺", "🪴", "💐", "🌾", "🌹", "🍁", "🍄", "🍄‍🟫", "🎋"],
            themeColor: "green"
        ),
        GameTheme(
            name: "Food",
            selectedEmojiSet: ["🥪", "🥓", "🌮", "🍣", "🍩", "🍿", "🍗", "🍕", "🍔", "🥙", "🍟", "🍮", "🍰", "🍦"],
            themeColor: "pink"
        ),
        GameTheme(
            name: "Emojis",
            selectedEmojiSet: ["😀", "😎", "😭", "😂", "😍", "😡", "🥶", "😶‍🌫️", "😱", "😬"],
            themeColor: "purple"
        )
        
    ]
    
    static func randdomTheme() -> GameTheme {
        let theme = allThemes.randomElement() ?? GameTheme(name: "Flags", selectedEmojiSet: ["🇬🇧", "🏴󠁧󠁢󠁥󠁮󠁧󠁿", "🏴󠁧󠁢󠁳󠁣󠁴󠁿", "🇩🇰", "🇺🇸", "🇨🇮", "🇨🇳", "🇳🇬", "🇫🇷", "🇸🇪"], themeColor: "blue")
        let numberOfPairs = Int.random(in: 2...theme.selectedEmojiSet.count)
        let emojis = theme.selectedEmojiSet.shuffled().prefix(numberOfPairs)
        return GameTheme(
            name: theme.name,
            selectedEmojiSet: Array(emojis),
            themeColor: theme.themeColor,
            numberOfPairsOfCards: numberOfPairs
            )
    }
    
    private init(name: String, selectedEmojiSet: [String], themeColor: String, numberOfPairsOfCards: Int) {
        self.name = name
        self.selectedEmojiSet = selectedEmojiSet
        self.themeColor = themeColor
        self.numberOfPairsOfCards = numberOfPairsOfCards
       }
    
    init(name: String, selectedEmojiSet: [String], themeColor: String) {
        self.name = name
        self.selectedEmojiSet = selectedEmojiSet
        self.themeColor = themeColor
        self.numberOfPairsOfCards = selectedEmojiSet.count
    }

}

enum Theme: CaseIterable {
    case flags
    case animals
    case gestures
    case plants
    case emojis
    case food
}
