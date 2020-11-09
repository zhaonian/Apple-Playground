//
// Created by Zhaonian Luan on 7/29/20.
// Copyright (c) 2020 zluan.io. All rights reserved.
//

import SwiftUI

struct Cardify: ViewModifier {

    let isFaceUp: Bool

    func body(content: Content) -> some View {
        ZStack {
            if isFaceUp {
                RoundedRectangle(cornerRadius: self.cornerRadius).fill(Color.white)
                RoundedRectangle(cornerRadius: self.cornerRadius).stroke(lineWidth: self.edgeLineWith)
                content
            } else {
                RoundedRectangle(cornerRadius: self.cornerRadius).fill(Color.orange)
            }
        }
    }

    private let cornerRadius: CGFloat = 10.0
    private let edgeLineWith: CGFloat = 3.0
}

extension View {
    func cardify(isFaceUp: Bool) -> some View {
        self.modifier(Cardify(isFaceUp: isFaceUp))
    }
}
