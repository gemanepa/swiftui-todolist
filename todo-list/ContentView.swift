//
//  ContentView.swift
//  todo-list
//
//  Created by Gabriel Ernesto Martinez Canepa on 24/12/2023.
//

import SwiftUI

struct ContentView: View {
    // Inject the view model into the view
    @ObservedObject var viewModel: TodoListViewModel
    @State private var newTodo = ""

    var body: some View {
        NavigationView {
            VStack {
                // Display the list of todos
                TodoListView(
                    todos: viewModel.todos,
                    deleteTodo: viewModel.deleteTodo,
                    toggleCompletion: viewModel.toggleTodoCompletion
                )

                // Input field to add a new todo
                TodoInputView(
                    newTodo: $newTodo,
                    addTodo: { title in
                        viewModel.addTodo(newTodo: title)
                        newTodo = "" // Optionally reset newTodo after adding
                    }
                )
            }
            .navigationTitle("Todo List")
            .navigationBarTitleDisplayMode(.inline)
            .alert(isPresented: $viewModel.showAlert) {
                // Display an alert for invalid todos
                Alert(
                    title: Text("Invalid Todo"),
                    message: Text(viewModel.alertMessage),
                    dismissButton: .default(Text("OK")) {
                        // Dismiss button pressed, reset alert properties
                        viewModel.resetAlert()
                    }
                )
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        // Create a dummy TodoListViewModel for preview purposes
        let dummyViewModel = TodoListViewModel()

        // Pass the dummyViewModel to ContentView
        ContentView(viewModel: dummyViewModel)
    }
}
