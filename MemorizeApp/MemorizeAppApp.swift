//
//  MemorizeAppApp.swift
//  MemorizeApp
//
//  Created by Lera Savchenko on 15.02.25.
//

import SwiftUI

@main
struct MemorizeAppApp: App {
    @StateObject var game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemorizeGameView(gameViewModel: game)
        }
    }
}
