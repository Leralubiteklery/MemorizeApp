//
//  GameTheme.swift
//  MemorizeApp
//
//  Created by Lera Savchenko on 19.07.25.
//

import Foundation

struct GameTheme {
    
    var name: String
    var numberOfPairsOfCards: Int
    var selectedEmojiSet: Array<String>
    var themeColor: String
    
    init(name: String, selectedEmojiSet: Array<String>, themeColor: String) {
        self.name = name
        self.themeColor = themeColor
        
        let maximumPairs = selectedEmojiSet.count
        self.numberOfPairsOfCards = Int.random(in: 4...maximumPairs)
        
        self.selectedEmojiSet = selectedEmojiSet.shuffled().prefix(numberOfPairsOfCards).map { $0 }
       
    }
    
    func set() -> GameTheme {
        let theme = Theme.allCases.randomElement() ?? .animals
        
        switch theme {
        case .flags:
            return GameTheme(
                name: "Flags",
                selectedEmojiSet: ["🇬🇧", "🏴󠁧󠁢󠁥󠁮󠁧󠁿", "🏴󠁧󠁢󠁳󠁣󠁴󠁿", "🇩🇰", "🇺🇸", "🇨🇮", "🇨🇳", "🇳🇬", "🇫🇷", "🇸🇪"],
                themeColor: "blue"
            )
        case .animals:
            return GameTheme(
                name: "Animals",
                selectedEmojiSet: ["🐢", "🐰", "🐶", "🐸", "🐈", "🐷", "🐼", "🦔", "🐄", "🐀"],
                themeColor: "orange"
            )
        case .gestures:
            return GameTheme(
                name: "Gestures",
                selectedEmojiSet: ["🤲", "👐", "🙌", "👏", "🤝", "👍", "👎", "✊", "✌️", "🤟"],
                themeColor: "yellow"
            )
        case .plants:
            return GameTheme(
                name: "Plants",
                selectedEmojiSet: ["☘️", "🌵", "🌴", "🌼", "🌺", "🪴", "💐", "🌾", "🌹", "🍁", "🍄", "🍄‍🟫", "🎋"],
                themeColor: "green"
            )
        case .food:
            return GameTheme(
                name: "Food",
                selectedEmojiSet: ["🥪", "🥓", "🌮", "🍣", "🍩", "🍿", "🍗", "🍕", "🍔", "🥙", "🍟", "🍮", "🍰", "🍦"],
                themeColor: "pink"
            )
        case .emojis:
            return GameTheme(
                name: "Emojis",
                selectedEmojiSet: ["😀", "😎", "😭", "😂", "😍", "😡", "🥶", "😶‍🌫️", "😱", "😬"],
                themeColor: "purple"
            )
        }
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
