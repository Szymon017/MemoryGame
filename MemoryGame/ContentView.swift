//
//  ContentView.swift
//  MemoryGame
//
//  Created by student on 17/10/2023.
//
 
import SwiftUI
 
struct ContentView: View {
    var icons = ["🦊","😎","🐶","🍀","🐪","🎸","👩‍🚒","🌝","🚕","⌛️"]
    @State var maxCard = 10
    @State var CardNumber: Int = 6
    var column = [GridItem(.flexible()), GridItem(.flexible())]
    var cardDelete: some View {
        cardButton(offset: -2, symbol: "-")
    }
    var cardAdd: some View {
        cardButton(offset: 2, symbol: "+")
    }
 
    var body: some View {
        VStack {
            Text("Memory game")
                .font(.largeTitle)
            LazyVGrid(columns: column, content: {
                ForEach(0...CardNumber-1, id:\.self){i in
                    CardView(item:icons[i])
                }
            })
 
        }
        .padding(12)
 
        HStack{
            cardDelete
            Spacer()
            cardAdd
        }
    }
 
 
    func cardButton(offset: Int, symbol: String) -> some View {
            let isEnabled = (offset > 0 && CardNumber + offset <= maxCard)
        || (offset < 0 && CardNumber + offset >= 2)
 
            return Button( action: {
                if isEnabled {
                    self.adjustCardNumber(by: offset)
                }
            }) {
                if isEnabled {
                    Text(symbol)
                        .font(.title)
                } else {
                    Text(symbol)
                        .font(.title)
                        .foregroundColor(.gray)
                }
            }
            .disabled(!isEnabled)
        }
 
        func adjustCardNumber(by offset: Int) {
            CardNumber += offset
 
        }
}
 
#Preview {
    ContentView()
}
 
