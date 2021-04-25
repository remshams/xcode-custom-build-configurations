//
//  TodoRepository.swift
//  custom-build-configuration
//
//  Created by Mathias Remshardt on 25.04.21.
//

import Foundation
import Combine

class TodoRepository {
  private static let todosPath = "todos"
  
  private let host: String
  
  init(host: String) {
    self.host = host
  }
}

extension TodoRepository: ListTodo {
  func list() -> AnyPublisher<[Todo], Error> {
    URLSession.shared.dataTaskPublisher(for: URL(string: "host/\(TodoRepository.todosPath)")!)
      .map(\.data)
      .decode(type: [TodoDto].self, decoder: JSONDecoder())
      .map { todoDtos in
        todoDtos.map { $0.convertToTodo() }
      }
      .eraseToAnyPublisher()
  }
}
