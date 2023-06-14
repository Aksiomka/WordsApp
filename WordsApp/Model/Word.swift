//
//  Word.swift
//  WordsApp
//
//  Created by Svetlana Gladysheva on 09.06.2023.
//

import SwiftData

@Model
class Word {
    var original: String
    var translation: String
    var category: Category?
    
    init(original: String, translation: String) {
        self.original = original
        self.translation = translation
    }
}
