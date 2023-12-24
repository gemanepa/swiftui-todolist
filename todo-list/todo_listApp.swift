//
//  todo_listApp.swift
//  todo-list
//
//  Created by Gabriel Ernesto Martinez Canepa on 24/12/2023.
//

import SwiftUI

@main
struct todo_listApp: App {
    // Create an instance of TodoListViewModel
    let viewModel = TodoListViewModel()

    var body: some Scene {
        WindowGroup {
            // Pass the viewModel to ContentView
            ContentView(viewModel: viewModel)
        }
    }
}
