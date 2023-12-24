//
//  todo_listUITests.swift
//  todo-listUITests
//
//  Created by Gabriel Ernesto Martinez Canepa on 24/12/2023.
//

import XCTest

final class todo_listUITests: XCTestCase {
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testAddTodo() {
        // Launch your app
        let app = XCUIApplication()
        app.launch()

        // Enter a todo title in the text field
        let newTodoTextField = app.textFields["New Todo"]
        newTodoTextField.tap()
        newTodoTextField.typeText("Todo")

        // Tap on the "Add" button
        app.buttons["Add"].tap()

        // Verify that the new todo is added to the list
        XCTAssertTrue(app.staticTexts["Todo"].exists, "New todo should be visible in the list")
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
