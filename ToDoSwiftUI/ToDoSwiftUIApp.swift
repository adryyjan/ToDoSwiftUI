//
//  ToDoSwiftUIApp.swift
//  ToDoSwiftUI
//
//  Created by Adrian Mazek on 19/07/2025.
//

import SwiftUI

@main
struct ToDoSwiftUIApp: App {
    @State private var viewModel = ListVM()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            
        }
        .environment(viewModel)
    }
}
