//
//  EmojiMemorizeGameView.swift
//  MemorizeApp
//
//  Created by Lera Savchenko on 15.02.25.
//

import SwiftUI

struct EmojiMemorizeGameView: View {
    
    @ObservedObject var gameViewModel: EmojiMemoryGame
    
    @State var randomCardsNumber: Int = 0
    @State var currentEmojis: [String] = []
    

//    let animalEmojis = ["🐢", "🐰", "🐶", "🐸", "🐈", "🐷", "🐼", "🦔", "🐄", "🐀"]
//    let gestureEmojis = ["🤲", "👐", "🙌", "👏", "🤝", "👍", "👎", "✊", "✌️", "🤟"]
    
    var body: some View {
        VStack {
            Text("Memorize!")
                .font(.largeTitle)
            ScrollView {
                cards
            }
//            Spacer()
//            cardThemeAdjusters
//                .imageScale(.large)
//                .font(.largeTitle)
            Button("Shuffle") {
                gameViewModel.shuffle()
            }
        }
        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum:85), spacing: 0)], spacing: 0) {
            ForEach(gameViewModel.cards.indices, id: \.self) { index in
                CardView(gameViewModel.cards[index])
                    .aspectRatio(2/3, contentMode: .fit)
                    .padding(4)
            }
        }
        .foregroundStyle(.orange)
    }
    
//    var cardThemeAdjusters: some View {
//        HStack {
//            cardThemeChanger(themeName: "Flags", imageName: "globe.europe.africa.fill", selectedEmojis: flagEmojis)
//            Spacer()
//            cardThemeChanger(themeName: "Animals", imageName: "hare.fill", selectedEmojis: animalEmojis)
//            Spacer()
//            cardThemeChanger(themeName: "Gestures", imageName: "hand.raised.fill", selectedEmojis: gestureEmojis)
//        }
//        .padding()
//    }
    
//    func cardThemeChanger(themeName: String, imageName: String, selectedEmojis: [String])  -> some View {
//        Button {
//            
//            currentEmojis = (selectedEmojis + selectedEmojis).shuffled()
//            randomCardsNumber = getRandomEvenCount(of: currentEmojis)
//            } label: {
//            VStack {
//                Image(systemName: imageName)
//                    .font(.title)
//                Text(themeName)
//                    .font(.body)
//            }
//        }
//    }
   
//    func getRandomEvenCount(of cardsArray: [String]) -> Int {
//        let evenCounts = (4...cardsArray.count).filter { $0 % 2 == 0 }
//        guard let randomEvenCount = evenCounts.randomElement() else { return 4 }
//        return randomEvenCount
//    }
    

}

struct CardView: View {
    let card: MemorizeGame<String>.Card
    
    init(_ card: MemorizeGame<String>.Card) {
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
    }
}

#Preview {
    EmojiMemorizeGameView(gameViewModel: EmojiMemoryGame())
}
