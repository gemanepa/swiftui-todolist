//
//  ContentView.swift
//  todo-list
//
//  Created by Gabriel Ernesto Martinez Canepa on 24/12/2023.
//

import SwiftUI;


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

struct TodoInputView: View {
    @Binding var newTodo: String
    var addTodo: (String) -> Void

    var body: some View {
        HStack {
            TextField("New Todo", text: $newTodo)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)

            Button(action: {
                            addTodo(newTodo)  // Call the closure with the current newTodo value
                        }) {
                            Text("Add")
                        }
            .padding(.horizontal)
        }
        .padding(20)
    }
}

struct ContentView: View {
    // Inject the view model into the view
    @ObservedObject var viewModel: TodoListViewModel
    @State private var newTodo = ""

    @State private var showAlert = false
    @State private var alertMessage = ""
    
    var body: some View {
        NavigationView {
            VStack {
                TodoListView(
                    todos: viewModel.todos,
                    deleteTodo: viewModel.deleteTodo,
                    toggleCompletion: viewModel.toggleTodoCompletion)

                TodoInputView(
                    newTodo: $newTodo,
                    addTodo: { title in
                        viewModel.addTodo(newTodo: title)
                        newTodo = ""  // Optionally reset newTodo after adding
                    }
                )
            }
            .navigationTitle("Todo List")
            .navigationBarTitleDisplayMode(.inline)
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Invalid Todo"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
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
