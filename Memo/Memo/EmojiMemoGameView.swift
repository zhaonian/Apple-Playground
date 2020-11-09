//
//  ContentView.swift
//  Memo
//
//  Created by Zhaonian Luan on 7/22/20.
//  Copyright © 2020 zluan.io. All rights reserved.
//

import SwiftUI

struct EmojiMemoGameView: View {

    @ObservedObject var viewModel: EmojiMemoGame

    var body: some View {
        Grid(viewModel.cards) { card in
            CardView(card: card).onTapGesture {
                self.viewModel.chooseCard(card: card)
            }
                    .padding(5)
        }
                .padding()
                .foregroundColor(Color.orange)
    }
}

struct CardView: View {
    let card: MemoGame<String>.Card

    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }

    @ViewBuilder
    private func body(for size: CGSize) -> some View {
        if card.isFaceUp || !card.isMatched {
            ZStack {
                Pie(startAngle: Angle.degrees(0 - 90), endAngle: Angle.degrees(110 - 90), clockWise: true)
                        .padding(5)
                        .opacity(0.4)

                Text(card.content).font(Font.system(size: fontSize(for: size)))
            }
                    .cardify(isFaceUp: card.isFaceUp)
        }
    }

    private func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * self.fontScaleFactor
    }

    private let fontScaleFactor: CGFloat = 0.75
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoGame()
        game.chooseCard(card: game.cards[0])
        return EmojiMemoGameView(viewModel: EmojiMemoGame())
    }
}
