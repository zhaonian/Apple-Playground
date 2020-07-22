//
//  ContentView.swift
//  Memo
//
//  Created by Zhaonian Luan on 7/22/20.
//  Copyright © 2020 zluan.io. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            ForEach(0..<4, content: { index in
                CardView(isFaceUp: true)
            })
        }
        .padding()
        .foregroundColor(Color.orange)
        .font(.largeTitle)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CardView: View {
    var isFaceUp: Bool

    var body: some View {
        ZStack {
            if isFaceUp {
                RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
                RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3.0)
                Text("💩").font(Font.largeTitle)
            } else {
                RoundedRectangle(cornerRadius: 10.0).fill(Color.orange)
                RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3.0)
            }
        }
    }
}