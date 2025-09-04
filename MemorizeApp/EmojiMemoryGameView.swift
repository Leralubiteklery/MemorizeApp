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
    
    
    var body: some View {
        VStack {
            Text("\(gameViewModel.currentTheme.name)")
                .font(.largeTitle)
            Text("Score: \(gameViewModel.score)")
            cards
                .animation(.default, value: gameViewModel.cards)
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
                action: { gameViewModel.shuffle() },
                backgroundColor: gameViewModel.setThemeColor()
            )
        }
        .padding()
    }
    
    private var cards: some View {
        AspectVGrid(items: gameViewModel.cards, aspectRatio: aspectRatio) { card in
            CardView(card)
                .padding(4)
                .onTapGesture {
                    gameViewModel.choose(card)
                }
        }
        .foregroundStyle(gameViewModel.setThemeColor())
    }
}

struct CardView: View {
    let card: MemoryGame<String>.Card
    
    init(_ card: MemoryGame<String>.Card) {
        self.card = card
    }
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(card.content)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1, contentMode: .fit)
            }
            .opacity(card.isFaceUp ? 1 : 0)
            base.fill()
                .opacity(card.isFaceUp ? 0 : 1)
        }
        .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
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
