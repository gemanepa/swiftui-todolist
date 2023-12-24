//
//  TodoItem.swift
//  todo-list
//
//  Created by Gabriel Ernesto Martinez Canepa on 24/12/2023.
//

import Foundation

struct TodoItem: Identifiable {
    var id = UUID()
    var title: String
    var completed = false
}
