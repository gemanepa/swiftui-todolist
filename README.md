# SwiftUI Todo List App

A simple SwiftUI iOS app that demonstrates the Model-View-ViewModel (MVVM) architecture for managing a todo list.

## Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Project Structure](#project-structure)
- [Dependencies](#dependencies)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

## Overview

This SwiftUI iOS app is a todo list application that follows the MVVM architecture. It allows users to create, view, update, and delete todo items. The app includes a clean and modular code structure, making it easy to understand and maintain.

## Features

- **Todo List:** View a list of todo items with options to mark them as completed or delete them.
- **Add Todo:** Add new todo items to the list with validation for duplicates.
- **Error Handling:** Display an alert for invalid todo entries with a dismissible message.

## Project Structure

The project follows a structured organization based on the MVVM architecture:

- **Views:** Contains SwiftUI views for rendering the user interface.
- **ViewModels:** Houses the view models responsible for managing the application's logic.
- **Models:** Defines the data models used in the app.
- **Helpers:** Includes utility functions and validation helpers.
- **Tests:** Holds unit tests, integration tests, or UI tests for the app.

## Dependencies

The app uses the following dependencies:

- **SwiftLint:** A linter for Swift to enforce coding style and conventions.
  - [GitHub Repository](https://github.com/realm/SwiftLint)
- **SwiftFormat:** A code formatter for Swift to maintain a consistent code style. `swiftformat .`
  - [GitHub Repository](https://github.com/nicklockwood/SwiftFormat)

## Usage

To use the app:

1. Clone the repository.
2. Open the Xcode project.
3. Build and run the app on a simulator or device.

## Contributing

Contributions are welcome! If you'd like to contribute, please follow the [contribution guidelines](CONTRIBUTING.md).

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
