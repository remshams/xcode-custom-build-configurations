//
//  TodoDto.swift
//  custom-build-configuration
//
//  Created by Mathias Remshardt on 25.04.21.
//

import Foundation

struct TodoDto: Codable {
  let id: Int
  let title: String
  let completed: Bool
}

extension TodoDto {
  
  func convertToTodo() -> Todo {
    Todo(id: id, title: title, completed: completed)
  }
  
}
