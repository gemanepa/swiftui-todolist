//
//  TodoInputView.swift
//  todo-list
//
//  Created by Gabriel Ernesto Martinez Canepa on 24/12/2023.
//

import SwiftUI

struct TodoInputView: View {
    @Binding var newTodo: String
    var addTodo: (String) -> Void

    var body: some View {
        HStack {
            // Input field for new todo
            TextField("New Todo", text: $newTodo)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)

            // Button to add a new todo
            Button(action: {
                addTodo(newTodo) // Call the closure with the current newTodo value
            }) {
                Text("Add")
            }
            .padding(.horizontal)
        }
        .padding(20)
    }
}
