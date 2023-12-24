//
//  ValidationHelper.swift
//  todo-listTests
//
//  Created by Gabriel Ernesto Martinez Canepa on 24/12/2023.
//

@testable import todo_list
import XCTest

import XCTest

class ValidationHelperTests: XCTestCase {
    func testValidTodo() {
        // Arrange
        let todoTitle = "ValidTodo"
        let existingTodos: [TodoItem] = [
            TodoItem(title: "ExistingTodo1"),
            TodoItem(title: "ExistingTodo2"),
        ]

        // Act
        let isValid = ValidationHelper.isValidTodo(todoTitle, existingTodos: existingTodos)

        // Assert
        XCTAssertTrue(isValid, "Expected the todo to be valid")
    }

    func testInvalidLength() {
        // Arrange
        let todoTitle = "ab" // Less than the required length
        let existingTodos: [TodoItem] = []

        // Act
        let isValid = ValidationHelper.isValidTodo(todoTitle, existingTodos: existingTodos)

        // Assert
        XCTAssertFalse(isValid, "Expected the todo to be invalid due to length")
    }

    func testInvalidWhitespace() {
        // Arrange
        let todoTitle = "   " // Only whitespace
        let existingTodos: [TodoItem] = []

        // Act
        let isValid = ValidationHelper.isValidTodo(todoTitle, existingTodos: existingTodos)

        // Assert
        XCTAssertFalse(isValid, "Expected the todo to be invalid due to whitespace")
    }

    func testDuplicateTodo() {
        // Arrange
        let todoTitle = "ExistingTodo1" // Already exists in the todos
        let existingTodos: [TodoItem] = [
            TodoItem(title: "ExistingTodo1"),
            TodoItem(title: "ExistingTodo2"),
        ]

        // Act
        let isValid = ValidationHelper.isValidTodo(todoTitle, existingTodos: existingTodos)

        // Assert
        XCTAssertFalse(isValid, "Expected the todo to be invalid due to duplication")
    }
}
