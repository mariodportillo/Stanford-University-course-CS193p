//
//  ContentView.swift
//  Memorize
//
//  Created by Mario D Portillo on 4/9/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
            ScrollView{
                LazyVGrid(columns: [GridItem(),GridItem(),GridItem()]) {
                    ForEach(viewModel.cards) { card in
                        CardView(card: card).onTapGesture {
                            viewModel.choose(card)
                        }
                    }
                    .aspectRatio(2/3, contentMode: .fit)
                }
            }
            .font(Font.largeTitle)
            .padding()
            .foregroundColor(.orange)
    }
}

struct CardView: View {
    let card: MemoryGame<String>.Card
    var body: some View {
        ZStack() {
            let shape = RoundedRectangle(cornerRadius: 20.0)
            if card.isFaceUp{
                shape.fill(Color.white)
                shape.stroke(lineWidth: 3)
                Text(card.content).font(Font.largeTitle)
            }else if card.isMatched {
                shape.opacity(0)
            }else{
                 shape.fill()
            }
        }
    }
}














struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: EmojiMemoryGame())
            .preferredColorScheme(.light)
        ContentView(viewModel: EmojiMemoryGame())
            .preferredColorScheme(.dark)
    }
}
