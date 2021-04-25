//
//  TodosContainer.swift
//  custom-build-configuration
//
//  Created by Mathias Remshardt on 25.04.21.
//

import Foundation

class TodosContainer: ObservableObject {
  private let listTodos: ListTodos
  
  init(listTodos: ListTodos) {
    self.listTodos = listTodos
  }
  
  func makeTodosViewModel() -> TodosViewModel {
    TodosViewModel(listTodo: listTodos)
  }
  
}
