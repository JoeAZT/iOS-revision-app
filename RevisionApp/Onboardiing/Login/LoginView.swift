//
//  LoginView.swift
//  RevisionApp
//
//  Created by Joe Taylor on 07/12/2024.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel: LoginViewModel
    
    var body: some View {
        VStack {
            Text("Login")
                .font(.largeTitle)
                .bold()
                .padding()
            
            Spacer()
            
            TextField("Email", text: $viewModel.email)
                .keyboardType(.emailAddress)
                .autocapitalization(.none)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
            
            SecureField("Password", text: $viewModel.password)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
            
            Button {
                print("Having trouble logging in - pressed")
            } label: {
                Text("Having trouble logging in?")
                    .foregroundColor(.blue)
                    .padding()
                    .frame(maxWidth: .infinity)
            }
            
            if let errorMessage = viewModel.errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .padding()
            }
            
            Spacer()
            
            Button {
                Task {
                    try await viewModel.login(email: viewModel.email, password: viewModel.password)
                }
            } label: {
                Text(viewModel.isLoading ? "Loading..." : "LOGIN")
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
    LoginView(
        viewModel: LoginViewModel(
            email: "email@gmail.com",
            password: "password1",
            isLoading: false
        )
    )
}
