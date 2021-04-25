//
//  TodosView.swift
//  custom-build-configuration
//
//  Created by Mathias Remshardt on 25.04.21.
//

import SwiftUI

struct TodosViewContainer: View {
  @EnvironmentObject var todosContainer: TodosContainer
  
  var body: some View {
    TodosView(model: todosContainer.makeTodosViewModel())
  }
}

struct TodosView: View {
  @ObservedObject var model: TodosViewModel
  
  var body: some View {
    List(model.todos) {
      TodoView(todo: $0)
    }.onAppear {
      model.loadTodos()
    }
  }
}

struct TodoView: View {
  let todo: Todo
  
  var body: some View {
    HStack {
      Text(String(todo.id))
      Text(todo.title)
      Spacer()
      Image(systemName: todo.completed ?  "checkmark.square" : "square")
    }
  }
}


#if DEBUG
struct TodoView_Previews: PreviewProvider {
  static var previews: some View {
    TodoView(todo: Todo(id: 0, title: "Todo", completed: false))
  }
}
#endif
