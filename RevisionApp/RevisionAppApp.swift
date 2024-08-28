//
//  RevisionAppApp.swift
//  RevisionApp
//
//  Created by Joe Taylor on 12/08/2024.
//

import SwiftUI

@main
struct RevisionAppApp: App {

    var body: some Scene {
        WindowGroup {
            MainView(viewModel: MainViewModel(router: Router()))
        }
    }
}
