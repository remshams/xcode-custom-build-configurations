//
//  TodosViewModel.swift
//  custom-build-configuration
//
//  Created by Mathias Remshardt on 25.04.21.
//

import Foundation
import Combine


class TodosViewModel: ObservableObject {
  private let listTodo: ListTodo
  private var cancellabes: Set<AnyCancellable> = []
  
  @Published var todos: [Todo] = []
  
  init(listTodo: ListTodo) {
    self.listTodo = listTodo
  }
  
  func loadTodos() -> Void {
    listTodo.list()
      .receive(on: DispatchQueue.main)
      .replaceError(with: [])
      .assign(to: \.todos, on: self)
      .store(in: &cancellabes)
  }
  
}
