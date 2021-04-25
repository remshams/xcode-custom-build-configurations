//
//  custom_build_configurationApp.swift
//  custom-build-configuration
//
//  Created by Mathias Remshardt on 25.04.21.
//

import SwiftUI

@main
struct custom_build_configurationApp: App {
  
  let appContainer = AppContainer()
  
  
  var body: some Scene {
    WindowGroup {
      TodosViewContainer().environmentObject(appContainer.makeTodosContainer())
    }
  }
}
