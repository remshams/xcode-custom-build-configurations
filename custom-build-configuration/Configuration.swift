//
//  Configuration.swift
//  custom-build-configuration
//
//  Created by Mathias Remshardt on 25.04.21.
//
import Foundation

enum ApplicationMode: String {
  case release
  case test
  case debug
}


#if TEST
let mode = ApplicationMode.test
#elseif DEBUG
let mode = ApplicationMode.debug
#else
let mode = RunningMode.release
#endif
