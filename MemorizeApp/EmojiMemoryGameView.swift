//
//  EmojiMemorizeGameView.swift
//  MemorizeApp
//
//  Created by Lera Savchenko on 15.02.25.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    
    @ObservedObject var gameViewModel: EmojiMemoryGame
    
    var body: some View {
        VStack {
            Text("\(gameViewModel.theme.name)")
                .font(.largeTitle)
            ScrollView {
                cards
                    .animation(.default, value: gameViewModel.cards)
            }
            HStack {
                Button("New Game") {
                    
                }
                Spacer()
                Button("Shuffle") {
                    gameViewModel.shuffle()
                }
            }
        }
        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum:85), spacing: 0)], spacing: 0) {
            ForEach(gameViewModel.cards) { card in
                CardView(card)
                    .aspectRatio(2/3, contentMode: .fit)
                    .padding(4)
                    .onTapGesture {
                        gameViewModel.choose(card)
                    }
            }
        }
        .foregroundStyle(.orange)
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

#Preview {
    EmojiMemoryGameView(gameViewModel: EmojiMemoryGame())
}
