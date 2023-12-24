//
//  TodoListView.swift
//  todo-list
//
//  Created by Gabriel Ernesto Martinez Canepa on 24/12/2023.
//

import SwiftUI

struct TodoListView: View {
    var todos: [TodoItem]
    var deleteTodo: (IndexSet) -> Void
    var toggleCompletion: (TodoItem) -> Void

    var body: some View {
        List {
            ForEach(todos) { todo in
                TodoItemView(todo: todo) {
                    toggleCompletion(todo)
                }
            }
            .onDelete(perform: deleteTodo)
        }
        .listStyle(PlainListStyle())
    }
}
