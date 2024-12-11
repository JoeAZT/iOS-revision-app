//
//  SignUpView.swift
//  RevisionApp
//
//  Created by Joe Taylor on 07/12/2024.
//

import SwiftUI

struct SignUpView: View {
    
    @StateObject var viewModel: AuthViewModel

    var body: some View {
        VStack {
            Text("Sign Up")
                .font(.largeTitle)
                .bold()
                .padding()
            
            Spacer()

            TextField("Name", text: $viewModel.name)
                .keyboardType(.emailAddress)
                .autocapitalization(.none)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
            TextField("Email", text: $viewModel.email)
                .keyboardType(.emailAddress)
                .autocapitalization(.none)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)

            SecureField("Password", text: $viewModel.passwordText)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)

            SecureField("Confirm Password", text: $viewModel.confirmPasswordText)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)

            if let errorMessage = viewModel.errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .padding()
            }
            Spacer()
            Button {
                Task {
                    try await viewModel.signUp(email: viewModel.email, password: viewModel.passwordText, name: viewModel.name)
                }
            } label: {
                Text(viewModel.isLoading ? "Loading..." : "SIGN UP")
                    .bold()
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(.appBlack)
                    .cornerRadius(8)
            }
            .disabled(viewModel.isLoading)
        }
        .padding(.horizontal)
    }
}

#Preview {
    SignUpView(
        viewModel: AuthViewModel()
    )
}