//
//  ValidationHelper.swift
//  todo-list
//
//  Created by Gabriel Ernesto Martinez Canepa on 24/12/2023.
//

import Foundation

struct ValidationHelper {
    static func isValidTodo(_ todoTitle: String, existingTodos: [TodoItem]) -> Bool {
        // Minimum Length Check
        guard todoTitle.count >= 3 else { return false }

        // Whitespace Check
        let trimmedTodo = todoTitle.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmedTodo.isEmpty else { return false }

        // Character Set Check
        let validCharacterSet = CharacterSet.alphanumerics
        guard todoTitle.rangeOfCharacter(from: validCharacterSet.inverted) == nil else { return false }

        // Duplicate Check
        guard !existingTodos.contains(where: { $0.title == todoTitle }) else { return false }

        return true
    }
}
