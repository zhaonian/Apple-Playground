//
// Created by Zhaonian Luan on 7/22/20.
// Copyright (c) 2020 zluan.io. All rights reserved.
//

import Foundation

struct MemoGame<CardContent> where CardContent: Equatable {

    var cards: Array<Card>
    var indexOfTheOneAndOnlyFaceUpCard: Int?

    init(totalNumberOfPairs: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<totalNumberOfPairs {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(id: pairIndex * 2, content: content))
            cards.append(Card(id: pairIndex * 2 + 1, content: content))
        }
    }

    mutating func chooseCard(card: Card) {
        print("Card chosen: \(card.content)")
        if let chosenCardIndex = self.cards.firstIndex(matching: card),
           !cards[chosenCardIndex].isFaceUp,
           !cards[chosenCardIndex].isMatched {
            if let potentialMatchedCardIndex = indexOfTheOneAndOnlyFaceUpCard {
                if self.cards[chosenCardIndex].content == self.cards[potentialMatchedCardIndex].content {
                    self.cards[chosenCardIndex].isMatched = true
                    self.cards[potentialMatchedCardIndex].isMatched = true
                }
                indexOfTheOneAndOnlyFaceUpCard = nil
            } else {
                for index in self.cards.indices {
                    self.cards[index].isFaceUp = false
                }
                indexOfTheOneAndOnlyFaceUpCard = chosenCardIndex
            }
            self.cards[chosenCardIndex].isFaceUp = true
        }
    }

    struct Card: Identifiable {
        var id: Int
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
    }
}
