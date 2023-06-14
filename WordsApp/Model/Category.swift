//
//  Category.swift
//  WordsApp
//
//  Created by Svetlana Gladysheva on 09.06.2023.
//

import SwiftData

@Model
class Category {
    @Attribute(.unique) var name: String
    @Relationship(.cascade, inverse: \Word.category) var words: [Word] = []
    
    init(name: String) {
        self.name = name
    }
}
