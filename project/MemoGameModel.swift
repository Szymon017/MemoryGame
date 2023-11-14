//
//  MemoGameModel.swift
//  MemoGame
//
//  Created by student on 07/11/2023.
//

import Foundation

struct MemoGameModel<CardContent> where CardContent : Equatable {
    
    private(set) var cards: Array<Card>
   
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards=[]
        for pair in 0..<max(2,numberOfPairsOfCards){
            let content = cardContentFactory(pair)
            cards.append(Card(id:"\(pair+1)a", content: content))
            cards.append(Card(id:"\(pair+1)b",content: content))
        }
    }
    
    
    mutating func choose(_ card: Card) {
        if let chosenIndex = cards.firstIndex(where: {$0.id == card.id}) {
           
                cards[chosenIndex].isFaceUp = true
          
        }
    }
    
    private func index(of card: Card) -> Int? {
        for index in cards.indices {
            if cards[index].id == card.id {
                return index
            }
        }
        return nil
    }
    
    mutating func shuffle(){
        cards.shuffle()
    }
     
    
    struct Card : Equatable, Identifiable {
        
        var id: String
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
    }
    
}

extension Array {
    var only: Element? {
        count == 1 ? first :nil
    }
}
