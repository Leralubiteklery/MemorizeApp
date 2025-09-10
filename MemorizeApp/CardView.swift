//
//  CardView.swift
//  MemorizeApp
//
//  Created by Lera Savchenko on 5.09.25.
//

import SwiftUI

typealias Card = MemoryGame<String>.Card
struct CardView: View {
    let card: Card
    
    init(_ card: Card) {
        self.card = card
    }
    
    var body: some View {
        Pie(endAngle: .degrees(240))
            .opacity(Constants.Pie.opacity)
            .overlay(
                Text(card.content)
                    .font(.system(size: Constants.FontSize.largest))
                    .minimumScaleFactor(Constants.FontSize.scaleFactor)
                    .aspectRatio(1, contentMode: .fit)
                    .padding(Constants.Pie.inset)
            )
            .padding(Constants.inset)
            .cardify(isFaceUp: card.isFaceUp)
            .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
    }
    
    private struct Constants {
        static let inset: CGFloat = 5
        struct FontSize {
            static let largest: CGFloat = 200
            static let  smallest: CGFloat = 10
            static let  scaleFactor = smallest / largest
        }
        struct Pie {
            static let opacity: CGFloat = 0.3
            static let inset: CGFloat = 5
        }
    }
    
    
}

#Preview {
    VStack {
        HStack {
            CardView(Card(isFaceUp: true, content: "X", id: "test1"))
            CardView(Card(content: "X", id: "test1"))
        }
        HStack {
            CardView(Card(isFaceUp: true, isMatched: true, content: "X", id: "test1"))
            CardView(Card(isMatched: true, content: "X", id: "test1"))
        }
    }
    .padding()
    .foregroundStyle(.gray)
}
