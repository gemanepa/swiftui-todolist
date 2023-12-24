//
//  TodoItemView.swift
//  todo-list
//
//  Created by Gabriel Ernesto Martinez Canepa on 24/12/2023.
//

import SwiftUI

struct TodoItemView: View {
    var todo: TodoItem
    var toggleCompletion: () -> Void

    var body: some View {
        HStack {
            Text(todo.title)
            Spacer()
            Image(systemName: todo.completed ? "checkmark.square.fill" : "square")
                .onTapGesture {
                    toggleCompletion()
                }
        }
    }
}
