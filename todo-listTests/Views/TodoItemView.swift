//
//  TodoItemView.swift
//  todo-listTests
//
//  Created by Gabriel Ernesto Martinez Canepa on 24/12/2023.
//

@testable import todo_list
import XCTest

class TodoItemViewTests: XCTestCase {
    func testTodoItemViewContent() {
        // Arrange
        let todo = TodoItem(title: "Test Todo")
        var isToggleCompletionCalled = false
        let toggleCompletion: () -> Void = {
            isToggleCompletionCalled = true
        }

        // Act
        let todoItemView = TodoItemView(todo: todo, toggleCompletion: toggleCompletion)

        // Assert
        XCTAssertEqual(todoItemView.todo.title, "Test Todo", "Unexpected todo title")
        XCTAssertFalse(isToggleCompletionCalled, "toggleCompletion should not be called initially")
    }
}
