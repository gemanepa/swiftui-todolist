//
//  TodoListViewModel.swift
//  todo-listTests
//
//  Created by Gabriel Ernesto Martinez Canepa on 24/12/2023.
//

@testable import todo_list
import XCTest

class TodoListViewModelTests: XCTestCase {
    func testAddValidTodo() {
        // Arrange
        let viewModel = TodoListViewModel()
        let newTodo = "ValidTodo"

        // Act
        viewModel.addTodo(newTodo: newTodo)

        // Assert
        XCTAssertTrue(viewModel.todos.count == 1, "Expected a valid todo to be added")
        XCTAssertFalse(viewModel.showAlert, "Expected showAlert to be false")
        XCTAssertEqual(viewModel.alertMessage, "", "Expected alertMessage to be empty")
    }

    func testAddInvalidTodo() {
        // Arrange
        let viewModel = TodoListViewModel()
        let invalidTodo = "ab" // Invalid due to length

        // Act
        viewModel.addTodo(newTodo: invalidTodo)

        // Assert
        XCTAssertTrue(viewModel.todos.isEmpty, "Expected invalid todo not to be added")
        XCTAssertTrue(viewModel.showAlert, "Expected showAlert to be true")
        XCTAssertEqual(viewModel.alertMessage, "Invalid todo. Please check the requirements.", "Unexpected alertMessage")
    }

    func testResetAlert() {
        // Arrange
        let viewModel = TodoListViewModel()

        // Act
        viewModel.resetAlert()

        // Assert
        XCTAssertFalse(viewModel.showAlert, "Expected showAlert to be false after resetAlert")
        XCTAssertEqual(viewModel.alertMessage, "", "Expected alertMessage to be empty after resetAlert")
    }

    func testToggleTodoCompletion() {
        // Arrange
        let viewModel = TodoListViewModel()
        let todo = TodoItem(title: "Test Todo")
        viewModel.todos.append(todo)

        // Act
        viewModel.toggleTodoCompletion(todo)

        // Assert
        XCTAssertTrue(viewModel.todos[0].completed, "Expected todo to be marked as completed")
    }

    func testDeleteTodo() {
        // Arrange
        let viewModel = TodoListViewModel()
        let todo1 = TodoItem(title: "Todo 1")
        let todo2 = TodoItem(title: "Todo 2")
        viewModel.todos = [todo1, todo2]

        // Act
        viewModel.deleteTodo(at: IndexSet(integer: 0))

        // Assert
        XCTAssertEqual(viewModel.todos.count, 1, "Expected one todo to be deleted")
        XCTAssertEqual(viewModel.todos[0].title, "Todo 2", "Unexpected todo after deletion")
    }

    // Add more test cases as needed
}
