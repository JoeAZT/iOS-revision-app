//
//  OnboardingView.swift
//  RevisionApp
//
//  Created by Joe Taylor on 08/12/2024.
//

import SwiftUI

struct AuthView: View {
    @State private var isSignUp: Bool = false

    var body: some View {
        VStack {
            if isSignUp {
                SignUpView(viewModel: SignUpViewModel())
            } else {
                LoginView(viewModel: LoginViewModel())
            }

            Button(action: { isSignUp.toggle() }) {
                Text(isSignUp ? "Already have an account? Log In" : "Don't have an account? Sign Up")
                    .foregroundColor(.blue)
                    .padding()
            }
        }
    }
}
