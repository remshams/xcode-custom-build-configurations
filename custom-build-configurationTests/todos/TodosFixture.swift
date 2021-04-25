//
//  TodoFixture.swift
//  custom-build-configurationTests
//
//  Created by Mathias Remshardt on 25.04.21.
//

import Foundation
@testable import custom_build_configuration

extension Todo {
  
  static func createFixture(id: Int = 0, title: String = "Todo", completed: Bool = false) -> Todo {
    Todo(id: id, title: title, completed: completed)
  }
  
  static func createFixtures(min: Int = 0, max: Int = 12) -> [Todo] {
    (0...Int.random(in: min...max)).map { createFixture(id: $0) }
  }
  
}
