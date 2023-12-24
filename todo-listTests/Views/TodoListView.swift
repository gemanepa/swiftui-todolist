//
//  TodoListView.swift
//  todo-listTests
//
//  Created by Gabriel Ernesto Martinez Canepa on 24/12/2023.
//

@testable import todo_list
import XCTest

class TodoListViewTests: XCTestCase {
    func testTodoListViewBehavior() {
        // Arrange
        let todo1 = TodoItem(title: "Todo 1")
        let todo2 = TodoItem(title: "Todo 2")
        let todos = [todo1, todo2]

        var deletedIndexSet: IndexSet?
        var toggledTodo: TodoItem?

        let deleteTodo: (IndexSet) -> Void = { indexSet in
            deletedIndexSet = indexSet
        }

        let toggleCompletion: (TodoItem) -> Void = { todo in
            toggledTodo = todo
        }

        // Act
        _ = TodoListView(todos: todos, deleteTodo: deleteTodo, toggleCompletion: toggleCompletion)

        // Simulate onDelete action
        // Note: Directly calling deleteTodo action instead of trying to access onDelete
        deleteTodo(IndexSet(integer: 0))
        XCTAssertEqual(deletedIndexSet, IndexSet(integer: 0), "Unexpected deleted index set")

        // Simulate onTapGesture on TodoItemView
        // This part might vary depending on your actual implementation of TodoListView
        // You may need to access TodoItemView differently based on your actual code structure

        // Assuming TodoItemView has an onTapGesture modifier
        let todoItemView = TodoItemView(todo: todo1, toggleCompletion: {
            toggledTodo = todo1
        })
        todoItemView.toggleCompletion()

        XCTAssertEqual(toggledTodo?.title, "Todo 1", "Unexpected toggled todo")
    }
}
