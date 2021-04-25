//
//  AppContainer.swift
//  custom-build-configuration
//
//  Created by Mathias Remshardt on 25.04.21.
//

import Foundation

protocol TodosRepository: ListTodos {}

class AppContainer: ObservableObject {
  private let todosRepository: TodosRepository
  private let todosContainer: TodosContainer
  
  init() {
    todosRepository = AppContainer.makeTodosRepository()
    todosContainer = AppContainer.makeTodosContainer(listTodos: todosRepository)
  }
  
  func makeTodosContainer() -> TodosContainer {
    todosContainer
  }
  
  private static func makeTodosRepository() -> TodosRepository {
    switch mode {
    case .test:
      return InMemoryTodosRepository()
    default:
      return ProductionTodosRepository(host: "https://jsonplaceholder.typicode.com")
    }
  }
  
  private static func makeTodosContainer(listTodos: ListTodos) -> TodosContainer {
    TodosContainer(listTodos: listTodos)
  }
}

extension ProductionTodosRepository: TodosRepository {}
extension InMemoryTodosRepository: TodosRepository {}
