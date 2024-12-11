//
//  ContentView.swift
//  RevisionApp
//
//  Created by Joe Taylor on 10/12/2024.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        Group {
            if viewModel.userSession != nil {
                QuizTabView()
            } else {
                OnboardingView(viewModel: viewModel)
            }
        }
    }
}
