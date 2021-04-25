//
//  InMemoryTodoRepository.swift
//  custom-build-configuration
//
//  Created by Mathias Remshardt on 25.04.21.
//

import Foundation
import Combine

class InMemoryTodosRepository {
  private var todos: [Todo]
  
  init(todos: [Todo] = []) {
    self.todos = todos
  }
}

extension InMemoryTodosRepository: ListTodos {
  func list() -> AnyPublisher<[Todo], Error> {
    Just(todos).setFailureType(to: Error.self).eraseToAnyPublisher()
  }
}
