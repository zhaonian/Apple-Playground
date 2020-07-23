//
// Created by Zhaonian Luan on 7/22/20.
// Copyright (c) 2020 zluan.io. All rights reserved.
//

import Foundation

class EmojiMemoGame {
    private var game: MemoGame<String> = createEmojiMemoGame()

    private static func createEmojiMemoGame() -> MemoGame<String> {
        let cardContents = ["🐱", "💩", "😈"]
        return MemoGame<String>(totalNumberOfPairs: 3) {
            (pairIndex: Int) -> String in cardContents[pairIndex]
        }
    }

    var cards: Array<MemoGame<String>.Card> {
        game.cards
    }

    func chooseCard(card: MemoGame<String>.Card) {
        game.chooseCard(card: card)
    }
}
