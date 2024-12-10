//
//  RevisionAppApp.swift
//  RevisionApp
//
//  Created by Joe Taylor on 12/08/2024.
//

import SwiftUI
import Firebase

@main
struct RevisionAppApp: App {
    
    init() {
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            OnboardingView()
                .environment(\.colorScheme, .light)
        }
    }
}
