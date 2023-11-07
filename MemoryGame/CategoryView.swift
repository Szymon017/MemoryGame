//
//  CategoryView.swift
//  MemoryGame
//
//  Created by student on 07/11/2023.
//

import SwiftUI

struct CategoryView: View {

    var cardColors: Color = .green
    var icon: String = ""
    var name: String = ""
    var categoryId: Int
    @State var categoryChanged: (Int) -> Void

    var body: some View {
        Group {
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .fill(cardColors)
                VStack {
                    Text(icon)
                        .font(.title)
                    Text(name).font(.system(size: 12)).foregroundColor(.black)
                }
            }
        }.onTapGesture {
            categoryChanged(categoryId)
        }
    }
}
