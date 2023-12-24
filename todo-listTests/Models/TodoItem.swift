//
//  TodoItem.swift
//  todo-listTests
//
//  Created by Gabriel Ernesto Martinez Canepa on 24/12/2023.
//
@testable import todo_list
import XCTest

class TodoItemTests: XCTestCase {
    func testTodoItemInitialization() {
        // Arrange
        let title = "Test Todo"

        // Act
        let todoItem = TodoItem(title: title)

        // Assert
        XCTAssertEqual(todoItem.title, title, "Unexpected title in TodoItem")
        XCTAssertFalse(todoItem.completed, "TodoItem should be initially incomplete")
        XCTAssertNotNil(todoItem.id, "TodoItem should have a non-nil ID")
    }
}
