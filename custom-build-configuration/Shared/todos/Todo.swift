//
//  Todo.swift
//  custom-build-configuration
//
//  Created by Mathias Remshardt on 25.04.21.
//

import Foundation
import Combine

protocol ListTodos {
  func list() -> AnyPublisher<[Todo], Error>
}

struct Todo: Equatable {
  let id: Int
  let title: String
  let completed: Bool
}
