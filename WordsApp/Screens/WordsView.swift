//
//  WordsView.swift
//  WordsApp
//
//  Created by Svetlana Gladysheva on 09.06.2023.
//

import SwiftUI
import SwiftData

struct WordsView: View {
    var category: Category
    
    @Environment(\.modelContext) var modelContext
    
    @State private var original = ""
    @State private var translation = ""
    
    var body: some View {
        VStack {
            List {
                ForEach(category.words, id: \.id) { word in
                    VStack {
                        Text("\(word.original)")
                        Text("\(word.translation)")
                    }
                }.onDelete(perform: { indexSet in
                    for index in indexSet {
                        deleteWord(index: index)
                    }
                })
            }
            TextField("Enter original", text: $original)
            TextField("Enter translation", text: $translation)
            Button(action: {
                createWord(original: original, translation: translation)
            }, label: {
                Text("Add word")
            })
        }
        .navigationBarTitle(Text("Words"), displayMode: .inline)
    }
    
    private func createWord(original: String, translation: String) {
        let word = Word(original: original, translation: translation)
        word.category = category
        category.words.append(word)
    }
    
    private func deleteWord(index: Int) {
        let word = category.words[index]
        modelContext.delete(word)
        category.words.removeAll(where: { $0 == word })
    }
}
