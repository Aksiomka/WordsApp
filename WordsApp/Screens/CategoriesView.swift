//
//  CategoriesView.swift
//  WordsApp
//
//  Created by Svetlana Gladysheva on 09.06.2023.
//

import SwiftUI
import SwiftData

struct CategoriesView: View {
    @Query(sort: \.name) var categories: [Category]
    
    @Environment(\.modelContext) var modelContext
    
    @State private var categoryName = ""
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(categories, id: \.id) { category in
                        NavigationLink(
                            category.name,
                            destination: {
                                WordsView(category: category)
                            }
                        )
                    }.onDelete(perform: { indexSet in
                        for index in indexSet {
                            deleteCategory(index: index)
                        }
                    })
                }
                TextField("Enter category name", text: $categoryName)
                Button(action: {
                    createCategory(name: categoryName)
                }, label: {
                    Text("Add category")
                })
            }
        }
    }
    
    private func createCategory(name: String) {
        let category = Category(name: categoryName)
        modelContext.insert(category)
    }
    
    private func deleteCategory(index: Int) {
        let category = categories[index]
        modelContext.delete(category)
    }
}
