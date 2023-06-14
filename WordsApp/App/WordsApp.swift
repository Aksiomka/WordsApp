//
//  WordsApp.swift
//  WordsApp
//
//  Created by Svetlana Gladysheva on 09.06.2023.
//

import SwiftUI

@main
struct WordsApp: App {
    var body: some Scene {
        WindowGroup {
            CategoriesView()
        }
        .modelContainer(for: [Category.self, Word.self])
    }
}
