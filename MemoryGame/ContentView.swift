//
//  ContentView.swift
//  MemoryGame
//
//  Created by student on 17/10/2023.
//
 
import SwiftUI
 
struct ContentView: View {
    @State var icons = ["🦊","😎","🐶","🍀","🐪","🎸","👩‍🚒","🌝","🚕","⌛️","🦊","😎","🐶","🍀","🐪","🎸","👩‍🚒","🌝","🚕","⌛️"]
    @State var maxCard = 20
    @State var CardNumber: Int = 6
    @State private var selectedCategoryId: Int = -1
    @State var rel: Bool = true
    @State var actualTheme: Int = 0
    var cardColors: [Color] = [.blue, .red, .green]

    
    
    var column = [GridItem(.flexible(minimum: 120),spacing: 20),
                  GridItem(.flexible(minimum: 50), spacing:300)]
    

    var CardDisplay: some View {
        ScrollView{
            Spacer()
            LazyVGrid(columns: column, content: {
                ForEach(0...CardNumber-1, id:\.self){i in
                    CardView(item:icons[i], theme: cardColors[actualTheme])
                }
            })
        }}
    var cardDelete: some View {
        cardButton(offset: -2, symbol: "-")
    }
    var cardAdd: some View {
        cardButton(offset: 2, symbol: "+")
    }
    
    func loadMotive(motive: Int) {
        switch motive {
        case 0:
            actualTheme = 0
        case 1:
            actualTheme = 1
        case 2:
            actualTheme = 2
        default:
            actualTheme = 0
        }
        icons.shuffle()
        
    }
 
    var body: some View {
        
        VStack {
            Text("Memory game")
                .font(.largeTitle)
            CardDisplay
        }
        
        HStack{
            cardDelete
            Spacer()
            themeDisplay
            Spacer()
            cardAdd
            
        }.padding(12)
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
    
    var themeDisplay: some View {
        return HStack {
            CategoryView(cardColors: cardColors[0], icon: "🦊", name:"Theme1", categoryId: 0, categoryChanged: loadMotive)
            Spacer()
            CategoryView(cardColors: cardColors[1], icon: "🌝",name:"Theme2", categoryId: 1, categoryChanged: loadMotive)
            Spacer()
            CategoryView(cardColors: cardColors[2], icon: "⌛️",name:"Theme3", categoryId: 2, categoryChanged: loadMotive)
        }.frame(width:240, height: 50)
    }
}
 
#Preview {
    ContentView()
}
 
