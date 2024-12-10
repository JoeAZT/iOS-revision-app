//
//  OnboardingView.swift
//  RevisionApp
//
//  Created by Joe Taylor on 08/12/2024.
//

import SwiftUI

struct OnboardingView: View {
    var viewModel: AuthViewModel
    @State private var isSignUp: Bool = false

    var body: some View {
        VStack {
            if isSignUp {
                SignUpView(viewModel: viewModel)
            } else {
                LoginView(viewModel: viewModel)
            }

            Button(action: { isSignUp.toggle() }) {
                Text(isSignUp ? "Already have an account? Log In" : "Don't have an account? Sign Up")
                    .foregroundColor(.blue)
                    .padding()
            }
        }
    }
}
