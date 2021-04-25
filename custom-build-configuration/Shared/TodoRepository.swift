//
//  TodoRepository.swift
//  custom-build-configuration
//
//  Created by Mathias Remshardt on 25.04.21.
//

import Foundation
import Combine

protocol ListTodo {
  func list() -> AnyPublisher<[Todo], Error>
}
