//
//  EmojiMemorizeGameView.swift
//  MemorizeApp
//
//  Created by Lera Savchenko on 15.02.25.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    
    @ObservedObject var gameViewModel: EmojiMemoryGame
    
    private let aspectRatio: CGFloat = 2/3
    private let spacing: CGFloat = 4
    
    
    var body: some View {
        VStack {
            Text("\(gameViewModel.currentTheme.name)")
                .font(.largeTitle)
            Text("Score: \(gameViewModel.score)")
            cards
        }
        HStack {
            GameButton(
                title: "New Game",
                action: { gameViewModel.startNewGame() },
                backgroundColor: gameViewModel.setThemeColor()
            )
            Spacer()
            GameButton(
                title: "Shuffle",
                action: { withAnimation {gameViewModel.shuffle()}},
                backgroundColor: gameViewModel.setThemeColor()
            )
        }
        .padding()
    }
    
    private var cards: some View {
        AspectVGrid(items: gameViewModel.cards, aspectRatio: aspectRatio) { card in
            CardView(card)
                .padding(spacing)
                .onTapGesture {
                    withAnimation {
                        gameViewModel.choose(card)
                    }
                }
        }
        .foregroundStyle(gameViewModel.setThemeColor())
    }
}

struct GameButton: View {
    let title: String
    let action: () -> Void
    let backgroundColor: Color
    
    var body: some View {
        Button(title, action: action)
            .foregroundStyle(.white)
            .font(.title2)
            .fontWeight(.bold)
            .frame(width: 150, height: 30)
            .background(backgroundColor)
            .cornerRadius(20)
    }
}

#Preview {
    EmojiMemoryGameView(gameViewModel: EmojiMemoryGame(currentTheme: GameTheme.randomTheme()))
}
