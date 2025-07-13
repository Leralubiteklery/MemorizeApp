//
//  MemorizeAppApp.swift
//  MemorizeApp
//
//  Created by Lera Savchenko on 15.02.25.
//

import SwiftUI

@main
struct MemorizeApp: App {
    @StateObject var game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(gameViewModel: game)
        }
    }
}
