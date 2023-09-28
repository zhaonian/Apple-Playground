//
//  ContentView.swift
//  News
//
//  Created by Keyu Gong on 9/26/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            Text("News")
                .navigationTitle("News")
        }
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
