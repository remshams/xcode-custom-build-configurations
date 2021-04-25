//
//  InMemoryTodoRepository.swift
//  custom-build-configuration
//
//  Created by Mathias Remshardt on 25.04.21.
//

import Foundation
import Combine

class InMemoryTodoRepository {
  private var todos: [Todo]
  
  init(todos: [Todo] = []) {
    self.todos = todos
  }
}

extension InMemoryTodoRepository: ListTodo {
  func list() -> AnyPublisher<[Todo], Error> {
    Just(todos).setFailureType(to: Error.self).eraseToAnyPublisher()
  }
}
