//
//  ContentView.swift
//  Memo
//
//  Created by Zhaonian Luan on 7/22/20.
//  Copyright © 2020 zluan.io. All rights reserved.
//

import SwiftUI

struct ContentView: View {

    @ObservedObject var viewModel: EmojiMemoGame

    var body: some View {
        HStack {
            ForEach(viewModel.cards) { card in
                CardView(card: card).onTapGesture {
                    self.viewModel.chooseCard(card: card)
                }
            }
        }
                .padding()
                .foregroundColor(Color.orange)
    }
}

struct CardView: View {
    var card: MemoGame<String>.Card

    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }

    private func body(for size: CGSize) -> some View {
        ZStack {
            if self.card.isFaceUp {
                RoundedRectangle(cornerRadius: self.cornerRadius).fill(Color.white)
                RoundedRectangle(cornerRadius: self.cornerRadius).stroke(lineWidth: self.edgeLineWith)
                Text(self.card.content)
            } else {
                RoundedRectangle(cornerRadius: self.cornerRadius).fill(Color.orange)
                RoundedRectangle(cornerRadius: self.cornerRadius).stroke(lineWidth: self.edgeLineWith)
            }
        }
                .font(Font.system(size: fontSize(for: size)))
    }

    private func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * self.fontScaleFactor
    }

    private let cornerRadius: CGFloat = 10.0
    private let edgeLineWith: CGFloat = 3.0
    private let fontScaleFactor: CGFloat = 0.75
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: EmojiMemoGame())
    }
}
