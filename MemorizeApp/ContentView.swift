//
//  ContentView.swift
//  MemorizeApp
//
//  Created by Lera Savchenko on 15.02.25.
//

import SwiftUI

struct ContentView: View {
    
    @State var randomCardsNumber: Int = 0
    @State var currentEmojis: [String] = []
    let flagEmojis = ["🇬🇧", "🏴󠁧󠁢󠁥󠁮󠁧󠁿", "🏴󠁧󠁢󠁳󠁣󠁴󠁿", "🇩🇰", "🇺🇸", "🇨🇮", "🇨🇳", "🇳🇬", "🇫🇷", "🇸🇪"]
    let animalEmojis = ["🐢", "🐰", "🐶", "🐸", "🐈", "🐷", "🐼", "🦔", "🐄", "🐀"]
    let gestureEmojis = ["🤲", "👐", "🙌", "👏", "🤝", "👍", "👎", "✊", "✌️", "🤟"]
    
    var body: some View {
        VStack {
            Text("Memorize!")
                .font(.largeTitle)
            ScrollView {
                cards
            }
            Spacer()
            cardThemeAdjusters
                .imageScale(.large)
                .font(.largeTitle)
        }
        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum:75))]) {

            ForEach(0..<randomCardsNumber, id: \.self) { index in
                CardView(content: currentEmojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundStyle(.orange)
    }
    
    var cardThemeAdjusters: some View {
        HStack {
            cardThemeChanger(themeName: "Flags", imageName: "globe.europe.africa.fill", selectedEmojis: flagEmojis)
            Spacer()
            cardThemeChanger(themeName: "Animals", imageName: "hare.fill", selectedEmojis: animalEmojis)
            Spacer()
            cardThemeChanger(themeName: "Gestures", imageName: "hand.raised.fill", selectedEmojis: gestureEmojis)
        }
        .padding()
    }
    
    func cardThemeChanger(themeName: String, imageName: String, selectedEmojis: [String])  -> some View {
        Button {
            
            currentEmojis = (selectedEmojis + selectedEmojis).shuffled()
            randomCardsNumber = getRandomEvenCount(of: currentEmojis)
            } label: {
            VStack {
                Image(systemName: imageName)
                    .font(.title)
                Text(themeName)
                    .font(.body)
            }
        }
    }
   
    func getRandomEvenCount(of cardsArray: [String]) -> Int {
        let evenCounts = (4...cardsArray.count).filter { $0 % 2 == 0 }
        guard let randomEvenCount = evenCounts.randomElement() else { return 4 }
        return randomEvenCount
    }
    

}

struct CardView: View {
    let content: String
    @State var isFaceUp = false
    
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}
