//
//  ContentView.swift
//  Memo
//
//  Created by Zhaonian Luan on 7/22/20.
//  Copyright © 2020 zluan.io. All rights reserved.
//

import SwiftUI

struct ContentView: View {

    let viewModel: EmojiMemoGame

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
        .font(.largeTitle)
    }
}

struct CardView: View {
    var card: MemoGame<String>.Card

    var body: some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
                RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3.0)
                Text(card.content).font(Font.largeTitle)
            } else {
                RoundedRectangle(cornerRadius: 10.0).fill(Color.orange)
                RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3.0)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: EmojiMemoGame())
    }
}
