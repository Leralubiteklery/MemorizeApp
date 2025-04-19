//
//  ContentView.swift
//  MemorizeApp
//
//  Created by Lera Savchenko on 15.02.25.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["👻", "😈", "🎃", "🕷️", "💀", "🍭", "🧙", "🙀", "😱", "🕸️", "👹"]
    
    @State var cardCount = 4
    
    var body: some View {
        VStack {
            cards
            cardCountAdjusters
                .imageScale(.large)
                .font(.largeTitle)
        }
        .padding()
    }
    
    var cards: some View {
        HStack {
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(content: emojis[index])
            }
        }
        .foregroundStyle(.orange)
    }
    
    var cardCountAdjusters: some View {
        HStack {
            cardRevomer
            Spacer()
            cardAdder
        }
    }
    
    func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
        Button(action: {
            cardCount += offset
        }, label: {
            Image(systemName: symbol)
        })
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }


var cardRevomer: some View {
    cardCountAdjuster(by: -1, symbol: "rectangle.stack.badge.minus.fill")
}

var cardAdder: some View {
    cardCountAdjuster(by: +1, symbol: "rectangle.stack.badge.plus.fill")
}

}

struct CardView: View {
    let content: String
    @State var isFaceUp = true
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            if isFaceUp {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            } else {
                base.fill()
            }
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}
