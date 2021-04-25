//
//  TestTodosViewModel.swift
//  custom-build-configurationTests
//
//  Created by Mathias Remshardt on 25.04.21.
//

import XCTest
import Combine
@testable import custom_build_configuration

class TestTodosViewModel: XCTestCase {
  var cancellabes: Set<AnyCancellable>!
  var todos: [Todo]!
  var listTodo: ListTodo!
  var model: TodosViewModel!
  
  override func setUp() {
    cancellabes = []
    todos = Todo.createFixtures(min: 2)
    listTodo = InMemoryTodoRepository(todos: todos)
    model = TodosViewModel(listTodo: listTodo)
  }
  
  override func tearDown() {
    cancellabes = []
  }
  
  func test_todos_shouldEmitEmptyArray() throws {
    XCTAssertEqual(model.todos, [])
  }
  
  func test_todos_shouldEmitLoadedTodos() throws {
    let exp = expectation(description: #function)
    model.$todos.dropFirst(1).sink { todosReceived in
      XCTAssertEqual(todosReceived, self.todos)
      exp.fulfill()
    }
    .store(in: &cancellabes)
    model.loadTodos()
    
    waitForExpectations(timeout: 2)
  }
  
}
